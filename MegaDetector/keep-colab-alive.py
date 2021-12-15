"""
Run this script to simulate double-click action after 30s. 
It is used to keep Colab page interacted to avoid the 
Colab notebook from stopping due to lack of interaction.

Requirements: pynput, which can be installed by `pip install pynput`
"""


from pynput.mouse import Controller, Button
import time
mouse = Controller()
while True:
     mouse.click(Button.left, 2)
     print('clicked')
     time.sleep(30)
 
