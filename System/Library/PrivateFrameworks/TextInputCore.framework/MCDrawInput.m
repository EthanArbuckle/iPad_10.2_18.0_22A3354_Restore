@implementation MCDrawInput

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3
{
  MCDrawInput *v3;
  uint64_t v5;

  v5 = 0;
  v3 = -[MCDrawInput initWithKeyboardLayout:rescaleKeyboardLayout:](self, "initWithKeyboardLayout:rescaleKeyboardLayout:", a3, &v5);
  if (v5)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v5);
  return v3;
}

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4
{
  MCDrawInput *v4;
  uint64_t v6;

  v6 = 0;
  v4 = -[MCDrawInput initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:](self, "initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:", a3, &v6, 1);
  if (v6)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v6);
  return v4;
}

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4 shouldResample:(BOOL)a5
{
  MCDrawInput *v8;
  MCDrawInput *v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t m_ptr;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MCDrawInput;
  v8 = -[MCKeyboardInput init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(unsigned int **)a3;
    if (*(_QWORD *)a3)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
    m_ptr = (uint64_t)v8->_keyboardLayout.m_ptr;
    v9->_keyboardLayout.m_ptr = (KeyboardLayout *)v10;
    if (m_ptr)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(m_ptr);
    v13 = *(unsigned int **)a4;
    if (*(_QWORD *)a4)
    {
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
    v15 = (uint64_t)v9->_rescaleKeyboardLayout.m_ptr;
    v9->_rescaleKeyboardLayout.m_ptr = (KeyboardLayout *)v13;
    if (v15)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v15);
    v9->_shouldResample = a5;
    v9->_resampler.m_params.segment_length = 15.0;
    *(_QWORD *)&v9->_resampler.m_params.inflection_point_detection_mode = 2;
    v9->_resampler.m_params.should_downsample = 1;
    v9->_resampler.m_params.minimum_pause_length = 0.3;
    v9->_resampler.m_params.should_flush_on_pause = 0;
    v9->_drawHand = 0;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCDrawInput;
  v4 = -[MCKeyboardInput copyWithZone:](&v12, sel_copyWithZone_, a3);
  if (v4)
  {
    +[MCDrawInput copyKeyboardLayout:](MCDrawInput, "copyKeyboardLayout:", &self->_keyboardLayout);
    v5 = *((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v11;
    if (v5)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v5);
    +[MCDrawInput copyKeyboardLayout:](MCDrawInput, "copyKeyboardLayout:", &self->_rescaleKeyboardLayout);
    v6 = *((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = 0;
    if (v6)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v6);
    v4[32] = self->_shouldResample;
    v8 = *(_OWORD *)&self->_resampler.m_params.segment_length;
    v7 = *(_OWORD *)&self->_resampler.m_params.should_downsample;
    v4[88] = self->_resampler.m_params.should_flush_on_pause;
    *(_OWORD *)(v4 + 56) = v8;
    *(_OWORD *)(v4 + 72) = v7;
    TI::CP::Path::operator=((char **)v4 + 12, (const void **)&self->_resampler.m_resampled_path.m_samples.__begin_);
    TI::CP::Path::operator=((char **)v4 + 18, (const void **)&self->_resampler.m_raw_path.m_samples.__begin_);
    v9 = *(_QWORD *)&self->_resampler.m_is_final;
    *((_DWORD *)v4 + 50) = self->_resampler.m_retroactively_processed_sample_count;
    *((_QWORD *)v4 + 24) = v9;
    *((_DWORD *)v4 + 9) = self->_drawHand;
  }
  return v4;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCKeyboardInput inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (-[MCDrawInput shouldResample](self, "shouldResample"))
      v7 = CFSTR("resampled ");
    else
      v7 = &stru_1EA1081D0;
    -[MCKeyboardInput inputs](self, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (-[MCDrawInput shouldResample](self, "shouldResample"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    -[MCDrawInput rescaleKeyboardLayout](self, "rescaleKeyboardLayout");
    if (v13)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v4, "appendFormat:", CFSTR("MCDrawInput: %@samples = %lu, shouldResample = %@, shouldRescale = %@"), v7, v9, v10, v11);
    if (v13)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v13);

  }
  return v4;
}

- (BOOL)_canCompose
{
  if (-[MCDrawInput isCompleting](self, "isCompleting"))
    return 0;
  else
    return !-[MCDrawInput isComplete](self, "isComplete");
}

- (BOOL)canComposeNew:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  if (-[MCDrawInput isComplete](self, "isComplete"))
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)composeNew:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  if (-[MCDrawInput canComposeNew:](self, "canComposeNew:") && !-[MCDrawInput isCompleting](self, "isCompleting"))
  {
    v4 = v15;
    -[MCKeyboardInput inputs](self, "inputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

    objc_msgSend(v4, "touchPoint");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "timestamp");
    v12 = v11;
    objc_msgSend(v4, "radius");
    v14 = v13;

    -[MCDrawInput _appendWithPoint:timestamp:force:radius:touchStage:](self, "_appendWithPoint:timestamp:force:radius:touchStage:", v6, v8, v10, v12, 0.0, v14);
  }

}

- (void)composeWith:(id)a3
{
  void *v3;
  _QWORD *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  if (!-[MCDrawInput _canCompose](self, "_canCompose"))
    goto LABEL_33;
  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    if (!objc_msgSend(v19, "stage"))
    {
      v10 = -[MCDrawInput resampler](self, "resampler");
      v11 = v10[12];
      if (v10[11] != v11 && *(double *)(v11 - 16) > 0.0)
        goto LABEL_33;
    }
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    if (objc_msgSend(v19, "stage"))
    {
      v5 = -[MCDrawInput resampler](self, "resampler");
      if (v5[12] == v5[11])
        goto LABEL_33;
    }
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample") || objc_msgSend(v19, "stage"))
  {
    v6 = 0;
  }
  else
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {

      goto LABEL_33;
    }
    v6 = 1;
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample") || !objc_msgSend(v19, "stage"))
  {
    if (v6)

LABEL_18:
    if (!objc_msgSend(v19, "stage"))
    {
      if ((int)objc_msgSend(v19, "fingerID") > 7)
      {
        v9 = 2;
LABEL_28:
        -[MCDrawInput setDrawHand:](self, "setDrawHand:", v9);
        goto LABEL_29;
      }
      if ((int)objc_msgSend(v19, "fingerID") >= 2)
      {
        v9 = 1;
        goto LABEL_28;
      }
    }
LABEL_29:
    if (-[MCDrawInput shouldResample](self, "shouldResample") && objc_msgSend(v19, "stage") == 2)
    {
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)-[MCDrawInput resampler](self, "resampler"));
      -[MCDrawInput _updateSampledInputs](self, "_updateSampledInputs");
    }
    else
    {
      objc_msgSend(v19, "location");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v19, "timestamp");
      v17 = v16;
      objc_msgSend(v19, "radius");
      -[MCDrawInput _appendWithPoint:timestamp:force:radius:touchStage:](self, "_appendWithPoint:timestamp:force:radius:touchStage:", objc_msgSend(v19, "stage"), v13, v15, v17, 0.0, v18);
    }
    goto LABEL_33;
  }
  -[MCKeyboardInput inputs](self, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6)
  if (v8)
    goto LABEL_18;
LABEL_33:

}

- (void)_appendWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  TI::CP::PathResampler *v22;
  unsigned int v23;
  _QWORD *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  double *v36;
  double *v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[MCDrawInput rescaleKeyboardLayout](self, "rescaleKeyboardLayout");
  if (v37)
  {
    v30 = x;
    v31 = y;
    v32 = a4;
    v33 = a5;
    v34 = a6;
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v37);
    -[MCDrawInput keyboardLayout](self, "keyboardLayout");
    v15 = v37[15];
    v14 = v37[16];
    v16 = v37[17];
    v17 = v37[18];
    -[MCDrawInput rescaleKeyboardLayout](self, "rescaleKeyboardLayout");
    v19 = v36[15];
    v18 = v36[16];
    v21 = v36[17];
    v20 = v36[18];
    v39.origin.x = v15;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v17;
    v40.origin.x = v19;
    v40.origin.y = v18;
    v40.size.width = v21;
    v40.size.height = v20;
    if (CGRectEqualToRect(v39, v40))
    {
      x = v30;
      y = v31;
    }
    else
    {
      x = v19 + (v30 - v15) / v16 * v21;
      y = v18 + (v31 - v14) / v17 * v20;
    }
    a5 = v33;
    a6 = v34;
    a4 = v32;
    if (v36)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v36);
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v37);
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    v22 = -[MCDrawInput resampler](self, "resampler");
    v38.x = x;
    v38.y = y;
    v23 = TI::CP::PathResampler::append_and_resample(v22, v38, a4, a5, a6);
    v24 = -[MCDrawInput resampler](self, "resampler");
    v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24[6] - v24[5]) >> 4) - v23;
    if (v25 >= 1)
    {
      do
      {
        -[MCKeyboardInput removeComposingInput](self, "removeComposingInput");
        --v25;
      }
      while (v25);
    }
    if ((_DWORD)v7 == 2)
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)-[MCDrawInput resampler](self, "resampler"));
    -[MCDrawInput _updateSampledInputs](self, "_updateSampledInputs");
  }
  else
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
    {
      -[MCKeyboardInput inputs](self, "inputs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }

    -[MCDrawInput _createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:](self, "_createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:", v7, v28, 0, x, y, a4, a5, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35.receiver = self;
    v35.super_class = (Class)MCDrawInput;
    -[MCKeyboardInput composeNew:](&v35, sel_composeNew_, v29);
    if ((_DWORD)v7 == 2)
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)-[MCDrawInput resampler](self, "resampler"));

  }
}

- (BOOL)isComplete
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  BOOL v6;

  if (!*(_BYTE *)(-[MCDrawInput resampler](self, "resampler") + 136))
    return 0;
  -[MCKeyboardInput inputs](self, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[MCDrawInput resampler](self, "resampler");
  v6 = v4 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[6] - v5[5]) >> 4);

  return v6;
}

- (BOOL)isCompleting
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  BOOL v6;

  if (!*(_BYTE *)(-[MCDrawInput resampler](self, "resampler") + 136))
    return 0;
  -[MCKeyboardInput inputs](self, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[MCDrawInput resampler](self, "resampler");
  v6 = v4 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[6] - v5[5]) >> 4);

  return v6;
}

- (BOOL)isDrawing
{
  if (-[MCDrawInput isCompleting](self, "isCompleting"))
    return 0;
  else
    return !-[MCDrawInput isComplete](self, "isComplete");
}

- (void)_updateSampledInputs
{
  _OWORD *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  std::vector<unsigned int> v25;
  void *v26[3];
  std::vector<unsigned int> __p;
  uint64_t v28;
  int v29;

  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    if (*(_BYTE *)(-[MCDrawInput resampler](self, "resampler") + 136))
    {
      -[MCDrawInput _updateSampledInputsWithResampler:permanentlyFinalized:](self, "_updateSampledInputsWithResampler:permanentlyFinalized:", -[MCDrawInput resampler](self, "resampler"), 1);
    }
    else
    {
      v3 = -[MCDrawInput resampler](self, "resampler");
      v4 = *((_QWORD *)v3 + 4);
      v5 = v3[1];
      v20 = *v3;
      v21 = v5;
      v22 = v4;
      std::vector<TI::CP::PathSample>::vector(&v23, (uint64_t)v3 + 40);
      std::vector<unsigned int>::vector(&v25, (const std::vector<unsigned int> *)(v3 + 4));
      std::vector<TI::CP::PathSample>::vector(v26, (uint64_t)v3 + 88);
      std::vector<unsigned int>::vector(&__p, (const std::vector<unsigned int> *)(v3 + 7));
      v6 = *((_QWORD *)v3 + 17);
      v29 = *((_DWORD *)v3 + 36);
      v28 = v6;
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)&v20);
      -[MCKeyboardInput inputs](self, "inputs", v20, v21, v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = 0;
        v10 = 0;
        while (1)
        {
          -[MCKeyboardInput inputs](self, "inputs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)v23) >> 4) <= v10)
            break;
          objc_msgSend(v12, "touchPoint");
          if (v14 != *(double *)((char *)v23 + v9) || v13 != *(double *)((char *)v23 + v9 + 8))
            break;

          ++v10;
          -[MCKeyboardInput inputs](self, "inputs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          v9 += 48;
          if (v17 <= v10)
            goto LABEL_16;
        }
        -[MCKeyboardInput inputs](self, "inputs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        for (; v10 != v19; --v19)
          -[MCKeyboardInput removeComposingInput](self, "removeComposingInput");
      }
LABEL_16:
      -[MCDrawInput _updateSampledInputsWithResampler:permanentlyFinalized:](self, "_updateSampledInputsWithResampler:permanentlyFinalized:", &v20, 0);
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      if (v26[0])
      {
        v26[1] = v26[0];
        operator delete(v26[0]);
      }
      if (v25.__begin_)
      {
        v25.__end_ = v25.__begin_;
        operator delete(v25.__begin_);
      }
      if (v23)
      {
        v24 = v23;
        operator delete(v23);
      }
    }
  }
}

- (void)_updateSampledInputsWithResampler:(const void *)a3 permanentlyFinalized:(BOOL)a4
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  objc_super v18;

  v17 = a4;
  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    -[MCKeyboardInput inputs](self, "inputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 6) - *((_QWORD *)a3 + 5)) >> 4);

    if (v7 < v8)
    {
      -[MCKeyboardInput inputs](self, "inputs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v9, "count");

      v11 = *((_QWORD *)a3 + 5);
      v12 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a3 + 6) - v11) >> 4);
      if (v12 > (int)v10)
      {
        v10 = (int)v10;
        do
        {
          v13 = v10 != 0;
          if (v10 && v17)
          {
            if (*((_BYTE *)a3 + 136))
            {
              if (v10 == v12 - 1)
                v13 = 2;
              else
                v13 = 1;
            }
            else
            {
              v13 = 1;
            }
          }
          if (v10 < 1)
          {
            v15 = 0;
          }
          else
          {
            -[MCKeyboardInput inputs](self, "inputs");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", (v10 - 1));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          -[MCDrawInput _createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:](self, "_createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:", v13, v15, TI::CP::Path::inflection_point_count((TI::CP::Path *)((char *)a3 + 40), v10, v10) != 0, *(double *)(v11 + 48 * v10), *(double *)(v11 + 48 * v10 + 8), *(double *)(v11 + 48 * v10 + 16), *(double *)(v11 + 48 * v10 + 24), *(double *)(v11 + 48 * v10 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18.receiver = self;
          v18.super_class = (Class)MCDrawInput;
          -[MCKeyboardInput composeNew:](&v18, sel_composeNew_, v16);

          ++v10;
          v11 = *((_QWORD *)a3 + 5);
          v12 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a3 + 6) - v11) >> 4);
        }
        while (v12 > v10);
      }
    }
  }
}

- (id)_createDrawableTouchInputWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7 previousTouchInput:(id)a8 isInflectionPoint:(BOOL)a9
{
  _BOOL8 v9;
  double y;
  double x;
  id v16;
  float v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int *v22;
  TI::Favonius::KeyboardLayout **v23;
  unsigned int v24;
  uint64_t v25;
  __n128 v26;
  int v27;
  int v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int *v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int v40;
  MCDrawableTouchInput *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int *v46;
  unsigned int *v47;
  uint64_t v48;
  int v49;
  uint64_t v50[5];
  uint64_t v51;
  unsigned int *v52;

  v9 = a9;
  y = a3.y;
  x = a3.x;
  v16 = a8;
  v52 = 0;
  if (-[MCDrawInput shouldResample](self, "shouldResample"))
  {
    v18 = -[MCDrawInput drawHand](self, "drawHand");
    -[MCDrawInput rescaleKeyboardLayout](self, "rescaleKeyboardLayout");
    v19 = v48;
    if (v48)
    {
      v48 = 0;
      v50[0] = v19;
    }
    else
    {
      -[MCDrawInput keyboardLayout](self, "keyboardLayout");
    }
    v20 = operator new();
    v21 = (unsigned int *)v20;
    *(_DWORD *)v20 = 1;
    *(double *)(v20 + 8) = x;
    *(double *)(v20 + 16) = y;
    v17 = a6;
    *(float *)(v20 + 24) = v17;
    *(double *)(v20 + 32) = a4;
    *(_DWORD *)(v20 + 40) = a7;
    *(_DWORD *)(v20 + 44) = 0;
    *(_DWORD *)(v20 + 48) = 0;
    *(_DWORD *)(v20 + 52) = v18;
    v22 = (unsigned int *)v50[0];
    *(_QWORD *)(v20 + 56) = v50[0];
    v23 = (TI::Favonius::KeyboardLayout **)(v20 + 56);
    if (v22)
    {
      do
        v24 = __ldaxr(v22);
      while (__stlxr(v24 + 1, v22));
      v51 = v20;
      if (v50[0])
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v50[0]);
    }
    else
    {
      v51 = v20;
    }
    if (v48)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v48);
    TI::Favonius::CMGeometryParameters::CMGeometryParameters((uint64_t)v50, v23);
    if (v16)
    {
      objc_msgSend(v16, "touchHistory");
      v25 = v48;
    }
    else
    {
      v25 = operator new();
      *(_DWORD *)(v25 + 8) = 1;
      *(_QWORD *)v25 = &off_1EA104628;
      *(_OWORD *)(v25 + 16) = 0u;
      *(_OWORD *)(v25 + 32) = 0u;
      *(_QWORD *)(v25 + 48) = 0;
      *(_OWORD *)(v25 + 56) = xmmword_1DA911110;
      *(_QWORD *)(v25 + 72) = 0x7F0000007FLL;
      *(_DWORD *)(v25 + 80) = 0;
      *(_OWORD *)(v25 + 88) = 0u;
      *(_OWORD *)(v25 + 104) = 0u;
      *(_OWORD *)(v25 + 120) = 0u;
      *(_DWORD *)(v25 + 136) = 0;
      *(_QWORD *)(v25 + 140) = 0x7F0000007FLL;
      *(_DWORD *)(v25 + 148) = -8388608;
    }
    v26.n128_f32[0] = TI::Favonius::CMTouchHistory::initialize_geometry_parameters_for_touch((uint64_t)&v51, (double *)v25, (uint64_t)v50);
    HIDWORD(v48) = v27;
    v49 = v28;
    LODWORD(v48) = -1169000438;
    v46 = v21;
    do
      v29 = __ldaxr(v21);
    while (__stlxr(v29 + 1, v21));
    v30 = v52;
    (*(void (**)(unsigned int **__return_ptr, uint64_t, unsigned int **, uint64_t *, __n128))(*(_QWORD *)v25 + 112))(&v47, v25, &v46, &v48, v26);
    v31 = v47;
    v47 = 0;
    v52 = v31;
    if (v30)
    {
      v32 = v30 + 2;
      v33 = atomic_load(v30 + 2);
      if (v33 == 1)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v30 + 8))(v30);
      }
      else
      {
        do
          v34 = __ldaxr(v32);
        while (__stlxr(v34 - 1, v32));
      }
      if (v47)
      {
        v35 = v47 + 2;
        v36 = atomic_load(v47 + 2);
        if (v36 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v47 + 8))();
        }
        else
        {
          do
            v37 = __ldaxr(v35);
          while (__stlxr(v37 - 1, v35));
        }
      }
    }
    if (v46)
      WTF::RefCounted<TI::Favonius::Touch>::deref((uint64_t)v46);
    v38 = (unsigned int *)(v25 + 8);
    v39 = atomic_load((unsigned int *)(v25 + 8));
    if (v39 == 1)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
    }
    else
    {
      do
        v40 = __ldaxr(v38);
      while (__stlxr(v40 - 1, v38));
    }
    if (v51)
      WTF::RefCounted<TI::Favonius::Touch>::deref(v51);
  }
  v41 = -[MCDrawableTouchInput initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:]([MCDrawableTouchInput alloc], "initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:", v9, &v52, x, y, a6, a4);
  if (v52)
  {
    v42 = v52 + 2;
    v43 = atomic_load(v52 + 2);
    if (v43 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v52 + 8))();
    }
    else
    {
      do
        v44 = __ldaxr(v42);
      while (__stlxr(v44 - 1, v42));
    }
  }

  return v41;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)keyboardLayout
{
  unsigned int **v2;
  unsigned int *m_ptr;
  unsigned int v4;

  m_ptr = (unsigned int *)self->_keyboardLayout.m_ptr;
  *v2 = m_ptr;
  if (m_ptr)
  {
    do
      v4 = __ldaxr(m_ptr);
    while (__stlxr(v4 + 1, m_ptr));
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)rescaleKeyboardLayout
{
  unsigned int **v2;
  unsigned int *m_ptr;
  unsigned int v4;

  m_ptr = (unsigned int *)self->_rescaleKeyboardLayout.m_ptr;
  *v2 = m_ptr;
  if (m_ptr)
  {
    do
      v4 = __ldaxr(m_ptr);
    while (__stlxr(v4 + 1, m_ptr));
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (BOOL)shouldResample
{
  return self->_shouldResample;
}

- (void)resampler
{
  return &self->_resampler;
}

- (int)drawHand
{
  return self->_drawHand;
}

- (void)setDrawHand:(int)a3
{
  self->_drawHand = a3;
}

- (void).cxx_destruct
{
  PathResampler *p_resampler;
  unsigned int *begin;
  PathSample *v5;
  unsigned int *v6;
  PathSample *v7;
  KeyboardLayout *m_ptr;
  KeyboardLayout *v9;

  p_resampler = &self->_resampler;
  begin = self->_resampler.m_raw_path.m_inflection_points.__begin_;
  if (begin)
  {
    p_resampler->m_raw_path.m_inflection_points.__end_ = begin;
    operator delete(begin);
  }
  v5 = p_resampler->m_raw_path.m_samples.__begin_;
  if (v5)
  {
    p_resampler->m_raw_path.m_samples.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_resampler->m_resampled_path.m_inflection_points.__begin_;
  if (v6)
  {
    p_resampler->m_resampled_path.m_inflection_points.__end_ = v6;
    operator delete(v6);
  }
  v7 = p_resampler->m_resampled_path.m_samples.__begin_;
  if (v7)
  {
    p_resampler->m_resampled_path.m_samples.__end_ = v7;
    operator delete(v7);
  }
  m_ptr = self->_rescaleKeyboardLayout.m_ptr;
  if (m_ptr)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)m_ptr);
  v9 = self->_keyboardLayout.m_ptr;
  if (v9)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v9);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0x402E000000000000;
  *((_QWORD *)self + 8) = 1;
  *((_BYTE *)self + 72) = 1;
  *((_QWORD *)self + 10) = 0x3FD3333333333333;
  *((_BYTE *)self + 88) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 50) = 0;
  *((_BYTE *)self + 192) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  return self;
}

+ (RefPtr<TI::Favonius::KeyboardLayout>)copyKeyboardLayout:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[2];
  TI::Favonius::LayoutKey *(*v11)(uint64_t, uint64_t *);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *(*v17)(_QWORD *, _QWORD *);
  _QWORD *(*v18)(uint64_t);
  const char *v19;
  _QWORD v20[3];

  v4 = v3;
  v5 = *(_QWORD *)a3;
  if (*(_QWORD *)a3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x4812000000;
    v17 = __Block_byref_object_copy__11616;
    v18 = __Block_byref_object_dispose__11617;
    v19 = "";
    memset(v20, 0, sizeof(v20));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v11 = __34__MCDrawInput_copyKeyboardLayout___block_invoke;
    v12 = &unk_1EA102658;
    v13 = &v14;
    v6 = *(uint64_t **)(v5 + 8);
    v7 = *(uint64_t **)(v5 + 16);
    v8 = v20;
    if (v6 != v7)
    {
      do
        v11((uint64_t)v10, v6++);
      while (v6 != v7);
      v8 = v15 + 6;
    }
    v9 = operator new();
    TI::Favonius::KeyboardLayout::KeyboardLayout(v9, v8);
    _Block_object_dispose(&v14, 8);
    a1 = WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v20);
  }
  else
  {
    v9 = 0;
  }
  *v4 = v9;
  return (RefPtr<TI::Favonius::KeyboardLayout>)a1;
}

TI::Favonius::LayoutKey *__34__MCDrawInput_copyKeyboardLayout___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  size_t v5;
  _BOOL4 v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int16 v11;
  TI::Favonius::LayoutKey *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t *v15;
  TI::Favonius::LayoutKey **v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  TI::Favonius::LayoutKey *result;
  __int128 v21;
  TI::Favonius::LayoutKey *v22;
  _BYTE v23[8];
  void *v24;
  uint64_t v25;
  CGRect v26;

  v25 = *MEMORY[0x1E0C80C00];
  KB::String::String((KB::String *)v23, (const KB::String *)(*a2 + 8));
  v4 = *a2;
  v5 = *(unsigned __int16 *)(*a2 + 40);
  if (v5 < 0xF)
  {
    v21 = *(_OWORD *)(*a2 + 40);
    v6 = (unsigned __int16)v21 > 0xEu;
  }
  else
  {
    LOWORD(v21) = *(_WORD *)(*a2 + 40);
    *((_QWORD *)&v21 + 1) = operator new[]();
    memcpy(*((void **)&v21 + 1), *(const void **)(v4 + 48), v5);
    v4 = *a2;
    v6 = 1;
  }
  v7 = *(double *)(v4 + 64);
  v8 = *(double *)(v4 + 72);
  v9 = *(double *)(v4 + 80);
  v10 = *(double *)(v4 + 88);
  v11 = *(_WORD *)(v4 + 62);
  v12 = (TI::Favonius::LayoutKey *)operator new();
  v26.origin.x = v7;
  v26.origin.y = v8;
  v26.size.width = v9;
  v26.size.height = v10;
  v22 = TI::Favonius::LayoutKey::LayoutKey(v12, (const KB::String *)v23, (const void **)&v21, v26, v11);
  if (v6 && *((_QWORD *)&v21 + 1))
    MEMORY[0x1DF0A212C](*((_QWORD *)&v21 + 1), 0x1000C8077774924);
  if (v24 && v23[6] == 1)
    free(v24);
  v13 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v15 = v13 + 6;
  v14 = v13[6];
  if (v14 != v13[8])
  {
    *(_QWORD *)(v13[7] + 8 * v14) = v12;
    do
LABEL_15:
      v19 = __ldaxr((unsigned int *)v12);
    while (__stlxr(v19 + 1, (unsigned int *)v12));
    v18 = *v15;
    goto LABEL_17;
  }
  v16 = (TI::Favonius::LayoutKey **)WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::expandCapacity(v13 + 6, v14 + 1, (unint64_t)&v22);
  v17 = v13[7];
  if (!v17)
    goto LABEL_18;
  v18 = *v15;
  v12 = *v16;
  *(_QWORD *)(v17 + 8 * *v15) = *v16;
  if (v12)
    goto LABEL_15;
LABEL_17:
  *v15 = v18 + 1;
LABEL_18:
  result = v22;
  if (v22)
    return (TI::Favonius::LayoutKey *)WTF::RefCounted<TI::Favonius::Key>::deref((uint64_t)v22);
  return result;
}

@end
