--
--  Copyright 2021 (C) Jeremy Grosser <jeremy@synack.me>
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with Ada.Interrupts;       use Ada.Interrupts;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Pico.Pimoroni.RGB_Keypad.Interrupts is

   --  This is an example IO IRQ handler to handle the keypad interrupt.
   --
   --  You can either instantiate this protected object type and use it in your
   --  project, or write your own alternative implementation if you require
   --  different logic such as handling multiple IO interrupts or doing
   --  additional work under interrupt context.
   protected type Handler (IRQ : Interrupt_ID := IO_IRQ_BANK0_Interrupt_CPU_1)
   is

      function Key_Event_Occurred return Boolean;

      procedure Clear_Event;

      --  Wait for an event, then clear it.
      entry Wait_For_Key_Event;

   private

      procedure IRQ_Handler
        with Attach_Handler => IRQ;

      Has_Event : Boolean := False;

   end Handler;

end Pico.Pimoroni.RGB_Keypad.Interrupts;
