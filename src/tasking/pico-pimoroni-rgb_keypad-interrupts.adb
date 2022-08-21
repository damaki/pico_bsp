--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO;

package body Pico.Pimoroni.RGB_Keypad.Interrupts is

   protected body Handler
   is

      function Key_Event_Occurred return Boolean is (Has_Event);

      procedure Clear_Event
      is
      begin
         Has_Event := False;
      end Clear_Event;

      --  Wait for an event
      entry Wait_For_Key_Event
        when Has_Event
      is
      begin
         Has_Event := False;
      end Wait_For_Key_Event;

      procedure IRQ_Handler
      is
      begin
         RP.GPIO.Acknowledge_Interrupt (INT.Pin, Falling_Edge);
         Has_Event := True;
      end IRQ_Handler;

   end Handler;

end Pico.Pimoroni.RGB_Keypad.Interrupts;
