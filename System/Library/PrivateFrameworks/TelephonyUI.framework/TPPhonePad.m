@implementation TPPhonePad

- (void)performTapActionDownForHighlightedKey
{
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_playsSounds)
      -[TPPhonePad _playSoundForKey:](self, "_playSoundForKey:");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TPDialerKeypadDelegate phonePad:appendString:](self->_delegate, "phonePad:appendString:", self, kKeyStrs[self->_highlightKey]);
      if (self->_delegate)
      {
        if ((unint64_t)(self->_highlightKey - 9) > 2
          || (-[TPPhonePad performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleKeyPressAndHoldForHighlightedKey_, 0, 1.0), self->_delegate))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[TPDialerKeypadDelegate phonePad:keyDown:](self->_delegate, "phonePad:keyDown:", self, kKeyValues[self->_downKey]);
        }
      }
    }
  }
}

- (void)performTapActionEndForHighlightedKey
{
  int64_t highlightKey;
  char v4;

  highlightKey = self->_highlightKey;
  if ((highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_delegate)
    {
      v4 = objc_opt_respondsToSelector();
      highlightKey = self->_highlightKey;
      if ((v4 & 1) != 0)
      {
        -[TPDialerKeypadDelegate phonePad:keyUp:](self->_delegate, "phonePad:keyUp:", self, kKeyValues[highlightKey]);
        highlightKey = self->_highlightKey;
      }
    }
    if (self->_playsSounds)
    {
      -[TPPhonePad _stopSoundForKey:](self, "_stopSoundForKey:", highlightKey);
      highlightKey = self->_highlightKey;
    }
    if ((unint64_t)(highlightKey - 9) <= 2)
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleKeyPressAndHoldForHighlightedKey_, 0);
  }
}

- (void)performTapActionCancelForHighlightedKey
{
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_playsSounds)
      -[TPPhonePad _stopSoundForKey:](self, "_stopSoundForKey:");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleKeyPressAndHoldForHighlightedKey_, 0);
  }
}

- (void)highlightKeyAtIndex:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TPDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1BCFA3000, v5, OS_LOG_TYPE_DEFAULT, "highlightKeyAtIndex: %ld", (uint8_t *)&v6, 0xCu);
  }

  self->_highlightKey = a3;
  -[TPPhonePad setNeedsDisplayForKey:](self, "setNeedsDisplayForKey:", a3);
}

- (int64_t)indexForHighlightedKey
{
  return self->_highlightKey;
}

+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4
{
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 != 35)
    goto LABEL_21;
  v7 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("**0"), 8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("*#06#")) & 1) != 0)
    {
      v9 = 1;
      goto LABEL_22;
    }
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v10 = v7 + v8;
  v11 = objc_msgSend(v6, "length");
  v12 = v10 + 1;
  if (v11 <= v10 + 1)
    goto LABEL_21;
  v13 = v11;
  if ((objc_msgSend(v6, "characterAtIndex:", v10) & 0xFFFE) != 0x34)
    goto LABEL_21;
  v14 = objc_msgSend(v6, "characterAtIndex:", v10 + 1);
  if (v14 == 50)
  {
    v12 = v10 + 2;
    if (v13 <= v10 + 2)
      goto LABEL_21;
    v14 = objc_msgSend(v6, "characterAtIndex:", v10 + 2);
  }
  if (v14 != 42)
    goto LABEL_21;
  v15 = v13 - 2;
  if (v12 >= v13 - 2)
    goto LABEL_21;
  do
  {
    v16 = objc_msgSend(v6, "characterAtIndex:", v12);
    v9 = v16 == 42 || (v16 - 48) < 0xA;
    if (v15 == v12)
      break;
    ++v12;
  }
  while (v9);
LABEL_22:

  return v9;
}

+ (BOOL)launchFieldTestIfNeeded:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("*3001#12345#*"));
  if (v3)
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchApplicationWithIdentifier:suspended:", CFSTR("com.apple.fieldtest"), 0);
  return v3;
}

- (TPPhonePad)initWithFrame:(CGRect)a3
{
  TPPhonePad *v3;
  TPPhonePad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPPhonePad;
  v3 = -[TPPhonePad initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TPPhonePad setOpaque:](v3, "setOpaque:", 0);
    -[TPPhonePad addTarget:action:forEvents:](v4, "addTarget:action:forEvents:", v4, sel__handleKey_forUIEvent_, 193);
    v4->_downKey = -1;
    v4->_highlightKey = -1;
    v4->_topHeight = 58.0;
    v4->_midHeight = 56.0;
    v4->_bottomHeight = 68.0;
    v4->_leftWidth = 96.0;
    v4->_midWidth = 91.0;
    v4->_rightWidth = 96.0;
    -[TPPhonePad setPlaysSounds:](v4, "setPlaysSounds:", 1);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  __CFDictionary *keyToButtonMap;
  objc_super v5;

  -[TPPhonePad _activateSounds:](self, "_activateSounds:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  keyToButtonMap = self->_keyToButtonMap;
  if (keyToButtonMap)
    CFRelease(keyToButtonMap);
  if (self->_inflightSounds)
  {
    -[TPPhonePad _stopAllSoundsForcingCallbacks:](self, "_stopAllSoundsForcingCallbacks:", 1);
    CFRelease(self->_inflightSounds);
  }
  v5.receiver = self;
  v5.super_class = (Class)TPPhonePad;
  -[TPPhonePad dealloc](&v5, sel_dealloc);
}

+ (void)_delayedDeactivate
{
  NSObject *v2;
  int inPropertyData;
  uint8_t buf[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!__SystemSoundActivationCount)
  {
    inPropertyData = 0;
    AudioServicesSetProperty(0x61637421u, 4u, &kSoundIDs, 4u, &inPropertyData);
    TPDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v5 = inPropertyData;
      _os_log_impl(&dword_1BCFA3000, v2, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
    }

    __PendingDeactivate = 0;
  }
}

- (void)_activateSounds:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id *v6;
  int v7;
  int v8;
  NSObject *v9;
  char v10;
  int inPropertyData;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (*((unsigned __int8 *)self + 564) >> 1) & 1;
  if (a3
    && -[TPPhonePad _isInAWindow](self, "_isInAWindow")
    && (v6 = (id *)MEMORY[0x1E0DC4730], (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isSuspended") & 1) == 0))
  {
    v7 = objc_msgSend(*v6, "isSuspendedEventsOnly") ^ 1;
  }
  else
  {
    v7 = 0;
  }
  if (v7 != v5)
  {
    if (v3)
      v8 = __SystemSoundActivationCount + 1;
    else
      v8 = __SystemSoundActivationCount - 1;
    __SystemSoundActivationCount = v8;
    if (v3 && v8 == 1)
    {
      if ((__PendingDeactivate & 1) == 0)
      {
        inPropertyData = 1;
        AudioServicesSetProperty(0x61637421u, 4u, &kSoundIDs, 4u, &inPropertyData);
        TPDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v13 = inPropertyData;
          _os_log_impl(&dword_1BCFA3000, v9, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
        }

      }
    }
    else if (!v3 && !v8)
    {
      objc_msgSend((id)objc_opt_class(), "performSelector:withObject:afterDelay:", sel__delayedDeactivate, 0, 0.0);
      __PendingDeactivate = 1;
    }
    if (v3)
      v10 = 2;
    else
      v10 = 0;
    *((_BYTE *)self + 564) = *((_BYTE *)self + 564) & 0xFD | v10;
  }
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[TPPhonePad _activateSounds:](self, "_activateSounds:", 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)TPPhonePad;
  -[TPPhonePad removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)_appSuspended
{
  -[TPPhonePad _activateSounds:](self, "_activateSounds:", 0);
}

- (void)_appResumed
{
  if (self->_playsSounds)
    -[TPPhonePad _activateSounds:](self, "_activateSounds:", 1);
}

- (void)movedFromWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPPhonePad;
  -[TPPhonePad movedFromWindow:](&v4, sel_movedFromWindow_, a3);
  -[TPPhonePad _activateSounds:](self, "_activateSounds:", 0);
}

- (void)movedToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPPhonePad;
  -[TPPhonePad movedToWindow:](&v4, sel_movedToWindow_, a3);
  if (self->_playsSounds)
    -[TPPhonePad _activateSounds:](self, "_activateSounds:", 1);
}

- (void)setDelegate:(id)a3
{
  TPDialerKeypadDelegate *v5;
  char v6;
  TPDialerKeypadDelegate *v7;

  v5 = (TPDialerKeypadDelegate *)a3;
  if (self->_delegate != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_delegate, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_opt_respondsToSelector();
    else
      v6 = 0;
    *((_BYTE *)self + 564) = *((_BYTE *)self + 564) & 0xFE | v6 & 1;
    self->_incompleteSounds = 0;
    v5 = v7;
  }

}

- (void)setPlaysSounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_playsSounds != a3)
  {
    v3 = a3;
    self->_playsSounds = a3;
    if (a3)
    {
      self->_inflightSounds = CFSetCreateMutable(0, 12, 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appSuspended, *MEMORY[0x1E0DC4848], 0);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appSuspended, *MEMORY[0x1E0DC4840], 0);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appResumed, *MEMORY[0x1E0DC4828], 0);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appResumed, *MEMORY[0x1E0DC4820], 0);
    }
    else
    {
      if (self->_inflightSounds)
      {
        -[TPPhonePad _stopAllSoundsForcingCallbacks:](self, "_stopAllSoundsForcingCallbacks:", 1);
        CFRelease(self->_inflightSounds);
        self->_inflightSounds = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4848], 0);
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4840], 0);
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4828], 0);
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4820], 0);
    }

    -[TPPhonePad _activateSounds:](self, "_activateSounds:", v3);
  }
}

- (void)setButton:(id)a3 forKeyAtIndex:(unint64_t)a4
{
  id v6;
  __CFDictionary *keyToButtonMap;
  void *value;

  v6 = a3;
  keyToButtonMap = self->_keyToButtonMap;
  value = v6;
  if (keyToButtonMap
    || (keyToButtonMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]),
        v6 = value,
        (self->_keyToButtonMap = keyToButtonMap) != 0))
  {
    if (v6)
    {
      -[TPPhonePad _rectForKey:](self, "_rectForKey:", a4);
      objc_msgSend(value, "setFrame:");
      -[TPPhonePad addSubview:](self, "addSubview:", value);
      CFDictionarySetValue(self->_keyToButtonMap, (const void *)a4, value);
    }
    else
    {
      CFDictionaryRemoveValue(keyToButtonMap, (const void *)a4);
    }
    v6 = value;
  }

}

- (id)_buttonForKeyAtIndex:(unint64_t)a3
{
  const __CFDictionary *keyToButtonMap;

  keyToButtonMap = self->_keyToButtonMap;
  if (keyToButtonMap)
  {
    CFDictionaryGetValue(keyToButtonMap, (const void *)a3);
    keyToButtonMap = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return keyToButtonMap;
}

- (void)setNeedsDisplayForKey:(int)a3
{
  -[TPPhonePad bounds](self, "bounds", *(_QWORD *)&a3);
  -[TPPhonePad setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (CGPoint)_keypadOrigin
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  -[TPPhonePad _keypadImage](self, "_keypadImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[TPPhonePad bounds](self, "bounds");
  v9 = (v8 - v5) * 0.5;
  v10 = roundf(v9);
  v12 = (v11 - v7) * 0.5;
  v13 = roundf(v12);
  -[TPPhonePad _yFudge](self, "_yFudge");
  v15 = v14 + v13;
  v16 = v10;
  result.y = v15;
  result.x = v16;
  return result;
}

- (id)_pressedImage
{
  return 0;
}

- (id)_keypadImage
{
  return 0;
}

- (id)_highlightedImage
{
  return 0;
}

- (double)_yFudge
{
  return 4.0;
}

- (CGRect)_updateRect:(CGRect)result withScale:(double)a4
{
  double v4;

  if (a4 != 1.0 && a4 != 0.0)
  {
    result.origin.x = result.origin.x * a4;
    result.origin.y = result.origin.y * a4;
    if (result.size.width <= 1.0)
      v4 = 1.0;
    else
      v4 = a4;
    result.size.width = result.size.width * v4;
    if (result.size.height > 1.0)
      result.size.height = result.size.height * a4;
  }
  return result;
}

- (id)_imageByCroppingImage:(id)a3 toRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  id v19;
  CGImage *v20;
  CGImage *v21;
  void *v22;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "scale");
  -[TPPhonePad _updateRect:withScale:](self, "_updateRect:withScale:", x, y, width, height, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_retainAutorelease(v9);
  v20 = (CGImage *)objc_msgSend(v19, "CGImage");

  v24.origin.x = v12;
  v24.origin.y = v14;
  v24.size.width = v16;
  v24.size.height = v18;
  v21 = CGImageCreateWithImageInRect(v20, v24);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v21);
  return v22;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  _BOOL4 v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TPPhonePad bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TPPhonePad _keypadImage](self, "_keypadImage");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "size");
  -[TPPhonePad _keypadOrigin](self, "_keypadOrigin");
  v42 = v17;
  v43 = v16;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v46.origin.x = v9;
  v46.origin.y = v11;
  v46.size.width = v13;
  v46.size.height = v15;
  v18 = CGRectEqualToRect(v44, v46);
  v19 = v18;
  if (v18)
    objc_msgSend(v41, "drawAtPoint:blendMode:alpha:", 17, v43, v42, 1.0);
  if (self->_downKey < 0)
  {
    v21 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (v19)
      goto LABEL_10;
  }
  else
  {
    -[TPPhonePad _rectForKey:](self, "_rectForKey:");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    if (v19)
      goto LABEL_10;
  }
  if (self->_downKey < 0)
    goto LABEL_9;
  v45.origin.x = v21;
  v45.origin.y = v23;
  v45.size.width = v25;
  v45.size.height = v27;
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  if (!CGRectEqualToRect(v45, v47))
  {
LABEL_9:
    -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v41, x - v43, y - v42, width, height);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "drawInRect:blendMode:alpha:", 17, x, y, width, height, 1.0);

  }
LABEL_10:
  if ((self->_downKey & 0x8000000000000000) == 0)
  {
    -[TPPhonePad _pressedImage](self, "_pressedImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v29, v21 - v43, v23 - v42, v25, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "drawInRect:blendMode:alpha:", 17, v21, v23, v25, v27, 1.0);

  }
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    -[TPPhonePad _rectForKey:](self, "_rectForKey:");
    if ((self->_highlightKey & 0x8000000000000000) == 0)
    {
      v35 = v31;
      v36 = v32;
      v37 = v33;
      v38 = v34;
      -[TPPhonePad _highlightedImage](self, "_highlightedImage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v39, v35 - v43, v36 - v42, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "drawInRect:blendMode:alpha:", 17, v35, v36, v37, v38, 1.0);

    }
  }

}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  TPPhonePad *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPPhonePad;
  -[TPPhonePad hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self;

      v5 = v6;
    }
  }
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  __CFDictionary *keyToButtonMap;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (((self->_downKey & 0x8000000000000000) == 0 || (self->_highlightKey & 0x8000000000000000) == 0 || !a3)
    && -[TPPhonePad isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TPPhonePad;
    -[TPPhonePad setHighlighted:](&v7, sel_setHighlighted_, v3);
    if ((self->_downKey & 0x8000000000000000) == 0)
      -[TPPhonePad setNeedsDisplayForKey:](self, "setNeedsDisplayForKey:");
    if ((self->_highlightKey & 0x8000000000000000) == 0)
      -[TPPhonePad setNeedsDisplayForKey:](self, "setNeedsDisplayForKey:");
    keyToButtonMap = self->_keyToButtonMap;
    if (keyToButtonMap)
    {
      CFDictionaryGetValue(keyToButtonMap, (const void *)self->_downKey);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelected:", v3);

    }
    if (!v3)
    {
      self->_downKey = -1;
      -[TPPhonePad _stopAllSoundsForcingCallbacks:](self, "_stopAllSoundsForcingCallbacks:", 0);
    }
  }
}

- (BOOL)cancelTouchTracking
{
  int64_t downKey;
  objc_super v5;

  downKey = self->_downKey;
  if ((downKey & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleKeyPressAndHoldForDownKey_, self);
    -[TPPhonePad setHighlighted:](self, "setHighlighted:", self->_highlightKey >= 0);
    self->_downKey = -1;
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TPDialerKeypadDelegate phonePad:keyUp:](self->_delegate, "phonePad:keyUp:", self, kKeyValues[downKey]);
    }
  }
  -[TPPhonePad _stopAllSoundsForcingCallbacks:](self, "_stopAllSoundsForcingCallbacks:", 1);
  v5.receiver = self;
  v5.super_class = (Class)TPPhonePad;
  return -[TPPhonePad cancelTouchTracking](&v5, sel_cancelTouchTracking);
}

- (void)_handleKey:(id)a3 forUIEvent:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int64_t downKey;
  char v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "touchesForView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "phase");
  if (v8 == 3)
  {
    downKey = self->_downKey;
    if ((downKey & 0x8000000000000000) == 0)
    {
      if (self->_delegate)
      {
        v11 = objc_opt_respondsToSelector();
        downKey = self->_downKey;
        if ((v11 & 1) != 0)
        {
          -[TPDialerKeypadDelegate phonePad:keyUp:](self->_delegate, "phonePad:keyUp:", self, kKeyValues[downKey]);
          downKey = self->_downKey;
        }
      }
      if (self->_playsSounds)
      {
        -[TPPhonePad _stopSoundForKey:](self, "_stopSoundForKey:", downKey);
        downKey = self->_downKey;
      }
      if ((unint64_t)(downKey - 9) <= 2)
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleKeyPressAndHoldForDownKey_, v12);
    }
  }
  else if (!v8)
  {
    if ((self->_downKey & 0x8000000000000000) == 0)
      -[TPPhonePad setHighlighted:](self, "setHighlighted:", self->_highlightKey >= 0);
    objc_msgSend(v7, "locationInView:", self);
    v9 = -[TPPhonePad _keyForPoint:](self, "_keyForPoint:");
    self->_downKey = v9;
    if ((v9 & 0x80000000) == 0)
    {
      if (self->_playsSounds)
        -[TPPhonePad _playSoundForKey:](self, "_playSoundForKey:");
      if (self->_delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[TPDialerKeypadDelegate phonePad:appendString:](self->_delegate, "phonePad:appendString:", self, kKeyStrs[self->_downKey]);
        if (self->_delegate)
        {
          if ((unint64_t)(self->_downKey - 9) > 2
            || (-[TPPhonePad performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleKeyPressAndHoldForDownKey_, v12, 1.0), self->_delegate))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              -[TPDialerKeypadDelegate phonePad:keyDown:](self->_delegate, "phonePad:keyDown:", self, kKeyValues[self->_downKey]);
          }
        }
      }
      -[TPPhonePad setHighlighted:](self, "setHighlighted:", 1);
    }
  }

}

- (void)_handleKeyPressAndHoldForHighlightedKey:(id)a3
{
  -[TPPhonePad _handleKeyPressAndHoldForKey:](self, "_handleKeyPressAndHoldForKey:", self->_highlightKey);
}

- (void)_handleKeyPressAndHoldForDownKey:(id)a3
{
  -[TPPhonePad _handleKeyPressAndHoldForKey:](self, "_handleKeyPressAndHoldForKey:", self->_downKey);
}

- (void)_handleKeyPressAndHoldForKey:(int64_t)a3
{
  __CFString *v4;
  char v5;
  TPDialerKeypadDelegate *delegate;

  if ((unint64_t)(a3 - 9) <= 2 && self->_delegate)
  {
    v4 = off_1E75FD4C0[a3 - 9];
    v5 = objc_opt_respondsToSelector();
    delegate = self->_delegate;
    if ((v5 & 1) != 0)
    {
      -[TPDialerKeypadDelegate phonePad:replaceLastDigitWithString:](delegate, "phonePad:replaceLastDigitWithString:", self, v4);
    }
    else if (delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TPDialerKeypadDelegate phonePadDeleteLastDigit:](self->_delegate, "phonePadDeleteLastDigit:", self);
      if (self->_delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[TPDialerKeypadDelegate phonePad:appendString:](self->_delegate, "phonePad:appendString:", self, v4);
      }
    }
  }
}

- (int)_keyForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double leftWidth;
  int v14;
  double topHeight;
  int v18;
  float v19;
  uint64_t v20;

  y = a3.y;
  x = a3.x;
  -[TPPhonePad _keypadImage](self, "_keypadImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  -[TPPhonePad _keypadOrigin](self, "_keypadOrigin");
  v10 = x - v9;
  v12 = y - v11;
  leftWidth = self->_leftWidth;
  if (v10 >= leftWidth)
  {
    if (v10 >= leftWidth + self->_midWidth)
      v14 = 2;
    else
      v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  if (v12 < 0.0 || v12 > v8)
    return -1;
  topHeight = self->_topHeight;
  if (v12 < topHeight)
  {
    v18 = 0;
    return v18 + v14;
  }
  if (v12 >= v8 - self->_bottomHeight)
  {
    v18 = 9;
    return v18 + v14;
  }
  v19 = (v12 - topHeight) / self->_midHeight;
  v20 = (uint64_t)(float)(floorf(v19) + 1.0);
  if (v20 >= 4)
    return -1;
  return 3 * v20 + v14;
}

- (CGRect)_rectForKey:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  int v8;
  double *p_leftWidth;
  double leftWidth;
  double v11;
  double *p_topHeight;
  double topHeight;
  double *p_midHeight;
  double midHeight;
  int *v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  CGRect result;

  -[TPPhonePad _keypadOrigin](self, "_keypadOrigin");
  v7 = a3 / 3;
  v8 = a3 % 3;
  p_leftWidth = &self->_leftWidth;
  leftWidth = self->_leftWidth;
  if (v8 < 2)
  {
    p_topHeight = &self->_topHeight;
    topHeight = self->_topHeight;
    p_midHeight = &self->_midHeight;
    midHeight = self->_midHeight;
    v11 = 0.0;
    if (!v8)
      goto LABEL_6;
    v16 = &OBJC_IVAR___TPPhonePad__midWidth;
  }
  else
  {
    v11 = self->_midWidth - leftWidth;
    p_topHeight = &self->_topHeight;
    topHeight = self->_topHeight;
    p_midHeight = &self->_midHeight;
    midHeight = self->_midHeight;
    v16 = &OBJC_IVAR___TPPhonePad__rightWidth;
  }
  p_leftWidth = (double *)((char *)self + *v16);
LABEL_6:
  v17 = *p_leftWidth;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 == 3)
      p_topHeight = &self->_bottomHeight;
    else
      p_topHeight = p_midHeight;
  }
  v18 = *p_topHeight;
  v19 = topHeight - midHeight;
  v20 = v7 - 1;
  if ((int)v7 <= 0)
    v20 = 0;
  v21 = v6 + topHeight * (double)(int)v7 - v19 * (double)v20;
  v22 = v5 + leftWidth * (double)v8 + v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (void)_notifySoundCompletionIfNecessary:(unsigned int)a3
{
  unsigned int incompleteSounds;
  unsigned int v5;

  incompleteSounds = self->_incompleteSounds;
  if (incompleteSounds)
  {
    v5 = incompleteSounds - 1;
    self->_incompleteSounds = v5;
    if (!v5)
    {
      AudioServicesRemoveSystemSoundCompletion(a3);
      if ((*((_BYTE *)self + 564) & 1) != 0)
        -[TPDialerKeypadDelegate phonePadDidEndSounds:](self->_delegate, "phonePadDidEndSounds:", self);
    }
  }
}

- (void)_playSoundForKey:(unint64_t)a3
{
  SystemSoundID v4;
  __CFRunLoop *Current;

  if (a3 <= 0xB)
  {
    v4 = kSoundIDs[a3];
    if (v4)
    {
      if ((*((_BYTE *)self + 564) & 1) != 0)
      {
        if (!self->_incompleteSounds)
          -[TPDialerKeypadDelegate phonePadWillBeginSounds:](self->_delegate, "phonePadWillBeginSounds:", self);
        Current = CFRunLoopGetCurrent();
        AudioServicesAddSystemSoundCompletion(v4, Current, (CFStringRef)*MEMORY[0x1E0C9B270], (AudioServicesSystemSoundCompletionProc)_SoundCompletedPlaying, self);
        ++self->_incompleteSounds;
      }
      AudioServicesStartSystemSound();
      CFSetAddValue(self->_inflightSounds, (const void *)a3);
    }
  }
}

- (void)_stopSoundForKey:(unint64_t)a3
{
  if (a3 <= 0xB)
  {
    if (kSoundIDs[a3])
    {
      AudioServicesStopSystemSound();
      CFSetRemoveValue(self->_inflightSounds, (const void *)a3);
    }
  }
}

- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3
{
  __CFSet *inflightSounds;
  _BOOL4 v5;
  uint64_t i;

  inflightSounds = self->_inflightSounds;
  if (inflightSounds)
  {
    v5 = a3;
    CFSetApplyFunction(inflightSounds, (CFSetApplierFunction)__TPStopSoundForKeyCallback, self);
    CFSetRemoveAllValues(self->_inflightSounds);
    if (v5)
    {
      for (i = 0; i != 12; ++i)
        AudioServicesRemoveSystemSoundCompletion(kSoundIDs[i]);
      if ((*((_BYTE *)self + 564) & 1) != 0)
      {
        if (self->_incompleteSounds)
          -[TPDialerKeypadDelegate phonePadDidEndSounds:](self->_delegate, "phonePadDidEndSounds:", self);
      }
      self->_incompleteSounds = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
