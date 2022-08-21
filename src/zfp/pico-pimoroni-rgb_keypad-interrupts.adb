--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package body Pico.Pimoroni.RGB_Keypad.Interrupts is

   INT_Handler : Change_Handler := null;

   ------------------------
   -- Keypad_INT_Handler --
   ------------------------

   procedure Keypad_INT_Handler
      (Pin     : RP.GPIO.GPIO_Pin;
       Trigger : RP.GPIO.Interrupt_Triggers)
   is
      pragma Unreferenced (Pin);
      pragma Unreferenced (Trigger);
   begin
      if INT_Handler /= null then
         INT_Handler.all;
      end if;
   end Keypad_INT_Handler;

   ------------
   -- Attach --
   ------------

   procedure Attach
      (Handler : Change_Handler)
   is
   begin
      --  INT is active-low and falls when any pad is pressed or released.
      --  An external 10k pullup resistor is connected, no internal pullup is needed.
      INT_Handler := Handler;
      INT.Set_Interrupt_Handler (Keypad_INT_Handler'Access);
      INT.Enable_Interrupt (RP.GPIO.Falling_Edge);
   end Attach;

end Pico.Pimoroni.RGB_Keypad.Interrupts;
