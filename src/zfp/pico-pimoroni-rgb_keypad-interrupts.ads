--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

package Pico.Pimoroni.RGB_Keypad.Interrupts is

   type Change_Handler is access procedure;
   procedure Attach
      (Handler : Change_Handler);
   --  Handler will be called when any pad is pressed or released

private

   procedure Keypad_INT_Handler
      (Pin     : RP.GPIO.GPIO_Pin;
       Trigger : RP.GPIO.Interrupt_Triggers);

end Pico.Pimoroni.RGB_Keypad.Interrupts;
