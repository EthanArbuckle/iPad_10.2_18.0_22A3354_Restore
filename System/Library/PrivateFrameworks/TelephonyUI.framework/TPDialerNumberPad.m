@implementation TPDialerNumberPad

- (void)setSoundController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (void)setPlaysSounds:(BOOL)a3
{
  TPDialerSoundController *v4;

  if (self->_playsSounds != a3)
  {
    if (a3)
    {
      v4 = objc_alloc_init(TPDialerSoundController);
      -[TPDialerNumberPad setSoundController:](self, "setSoundController:", v4);

    }
    else
    {
      -[TPDialerNumberPad setSoundController:](self, "setSoundController:", 0);
    }
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPDialerKeypadDelegate *)a3;
}

+ (id)dialerNumberPadFullCharacters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dialerNumberPadNumericCharacters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)buttonUp:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TPDialerNumberPad soundController](self, "soundController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopSoundForDialerCharacter:", objc_msgSend(v5, "character"));

  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[TPDialerKeypadDelegate phonePad:keyUp:](self->_delegate, "phonePad:keyUp:", self, (char)-[__CFString characterAtIndex:](TPNumberPadCharacterValues[objc_msgSend(v5, "character")], "characterAtIndex:", 0));

}

- (void)buttonUpOutside:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  -[TPDialerNumberPad soundController](self, "soundController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "character");

  objc_msgSend(v5, "stopSoundForDialerCharacter:", v6);
  -[TPDialerNumberPad delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TPDialerNumberPad delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TPDialerNumberPad delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "phonePadDeleteLastDigit:", self);

    }
  }
}

- (void)buttonDown:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TPDialerNumberPad soundController](self, "soundController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playSoundForDialerCharacter:", objc_msgSend(v5, "character"));

  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TPDialerKeypadDelegate phonePad:appendString:](self->_delegate, "phonePad:appendString:", self, TPNumberPadCharacterValues[objc_msgSend(v5, "character")]);
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[TPDialerKeypadDelegate phonePad:keyDown:](self->_delegate, "phonePad:keyDown:", self, (char)-[__CFString characterAtIndex:](TPNumberPadCharacterValues[objc_msgSend(v5, "character")], "characterAtIndex:", 0));
  }

}

- (void)buttonLongPressed:(id)a3
{
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "character") == 10)
  {
    v4 = CFSTR("+");
  }
  else if (objc_msgSend(v21, "character") == 9)
  {
    v4 = CFSTR(",");
  }
  else
  {
    if (objc_msgSend(v21, "character") != 11)
    {
      if (!objc_msgSend(v21, "character"))
      {
        -[TPDialerNumberPad delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) != 0)
        {
          -[TPDialerNumberPad delegate](self, "delegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "phonePad:dialerCharacterButtonWasHeld:", self, objc_msgSend(v21, "character"));
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
    v4 = CFSTR(";");
  }
  -[TPDialerNumberPad delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[TPDialerNumberPad delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TPDialerNumberPad delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phonePad:replaceLastDigitWithString:", self, v4);
LABEL_16:

      goto LABEL_17;
    }
  }
  -[TPDialerNumberPad delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[TPDialerNumberPad delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[TPDialerNumberPad delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "phonePadDeleteLastDigit:", self);

    }
  }
  -[TPDialerNumberPad delegate](self, "delegate");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[TPDialerNumberPad delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[TPDialerNumberPad delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phonePad:appendString:", self, v4);
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (int64_t)indexForHighlightedKey
{
  return -1;
}

- (BOOL)playsSounds
{
  return self->_playsSounds;
}

- (TPDialerKeypadDelegate)delegate
{
  return self->_delegate;
}

- (TPDialerSoundController)soundController
{
  return (TPDialerSoundController *)objc_getProperty(self, a2, 504, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundController, 0);
}

@end
