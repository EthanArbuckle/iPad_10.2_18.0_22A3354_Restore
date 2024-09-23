@implementation SCROVirtualBrailleDisplay

- (SCROVirtualBrailleDisplay)initWithMainSize:(int64_t)a3
{
  NSObject *v5;
  SCROVirtualBrailleDriver *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  SCROVirtualBrailleDisplay *v14;
  objc_super v16;
  uint8_t buf[4];
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0)
  {
    _SCROD_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = a3;
      _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create a virtual display: mainSize is nonpositive (%ld).", buf, 0xCu);
    }
    v14 = 0;
  }
  else
  {
    v5 = objc_opt_new();
    v6 = -[SCROVirtualBrailleDriver initWithMainSize:delegate:]([SCROVirtualBrailleDriver alloc], "initWithMainSize:delegate:", a3, self);
    +[SCROBrailleDisplayManager sharedManager](SCROBrailleDisplayManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)SCROVirtualBrailleDisplay;
    v8 = -[SCROBrailleDisplay _initWithDriver:driverIdentifier:ioElement:delegate:](&v16, sel__initWithDriver_driverIdentifier_ioElement_delegate_, v6, CFSTR("com.apple.scrod.virtual.display"), v5, v7);

    if (v8)
    {
      v9 = (void *)objc_opt_new();
      v10 = a3;
      do
      {
        objc_msgSend(v9, "appendString:", CFSTR("⠀"));
        --v10;
      }
      while (v10);
      v11 = (void *)*((_QWORD *)v8 + 33);
      *((_QWORD *)v8 + 33) = v9;
      v12 = v9;

      *((_QWORD *)v8 + 32) = a3;
      objc_storeStrong((id *)v8 + 34, v6);

      _SCROD_LOG();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = a3;
        _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "Created a virtual display with main size: %ld", buf, 0xCu);
      }

    }
    self = (SCROVirtualBrailleDisplay *)v8;

    v14 = self;
  }

  return v14;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (id)mainCells
{
  return self->_mainCells;
}

- (void)didSetMainCells:(id)a3
{
  objc_storeStrong((id *)&self->_mainCells, a3);
}

- (void)pressPanLeft
{
  -[SCROVirtualBrailleDriver enqueuePan:down:](self->_virtualDriver, "enqueuePan:down:", 1, 1);
  -[SCROVirtualBrailleDriver enqueuePan:down:](self->_virtualDriver, "enqueuePan:down:", 1, 0);
}

- (void)pressPanRight
{
  -[SCROVirtualBrailleDriver enqueuePan:down:](self->_virtualDriver, "enqueuePan:down:", 0, 1);
  -[SCROVirtualBrailleDriver enqueuePan:down:](self->_virtualDriver, "enqueuePan:down:", 0, 0);
}

- (void)pressPrevious
{
  -[SCROVirtualBrailleDisplay _simulateKeypressWithMask:](self, "_simulateKeypressWithMask:", 78150);
}

- (void)pressNext
{
  -[SCROVirtualBrailleDisplay _simulateKeypressWithMask:](self, "_simulateKeypressWithMask:", 78166);
}

- (void)pressKeyChord:(unint64_t)a3
{
  __int16 v3;

  v3 = a3;
  if ((a3 & 2) != 0)
  {
    -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 1, 1);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 2, 1);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 3, 1);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 4, 1);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 5, 1);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 6, 1);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 7, 1);
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 8, 1);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  -[SCROVirtualBrailleDriver enqueueSpaceWithDown:](self->_virtualDriver, "enqueueSpaceWithDown:", 1);
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 1, 0);
  if ((v3 & 4) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 2, 0);
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 3, 0);
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 4, 0);
  if ((v3 & 0x20) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 5, 0);
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 6, 0);
  if ((v3 & 0x80) == 0)
  {
LABEL_17:
    if ((v3 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 7, 0);
  if ((v3 & 0x100) == 0)
  {
LABEL_18:
    if ((v3 & 0x200) == 0)
      return;
LABEL_37:
    -[SCROVirtualBrailleDriver enqueueSpaceWithDown:](self->_virtualDriver, "enqueueSpaceWithDown:", 0);
    return;
  }
LABEL_36:
  -[SCROVirtualBrailleDriver enqueueDot:down:](self->_virtualDriver, "enqueueDot:down:", 8, 0);
  if ((v3 & 0x200) != 0)
    goto LABEL_37;
}

- (void)pressRouterWithIndex:(unint64_t)a3
{
  NSObject *v5;
  int64_t mainSize;
  int v7;
  unint64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_mainSize <= a3)
  {
    _SCROD_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      mainSize = self->_mainSize;
      v7 = 134218240;
      v8 = a3;
      v9 = 2048;
      v10 = mainSize;
      _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Virtual display: router index (%ld) out of bound (%ld)", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    -[SCROVirtualBrailleDriver enqueueRouter:down:](self->_virtualDriver, "enqueueRouter:down:", a3, 1);
    -[SCROVirtualBrailleDriver enqueueRouter:down:](self->_virtualDriver, "enqueueRouter:down:", a3, 0);
  }
}

- (void)_simulateKeypressWithMask:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setDisplayToken:", -[SCROBrailleDisplay token](self, "token"));
  objc_msgSend(v5, "setDisplayMode:", 0);
  objc_msgSend(v5, "addKeyMask:", v3);
  -[SCROBrailleDisplay simulateKeypress:](self, "simulateKeypress:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDriver, 0);
  objc_storeStrong((id *)&self->_mainCells, 0);
}

@end
