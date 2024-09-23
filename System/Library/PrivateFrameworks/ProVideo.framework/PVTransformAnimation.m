@implementation PVTransformAnimation

- (PVTransformAnimation)initWithAnimation:(id)a3 simplify:(BOOL)a4 tolerance:(double)a5 smoothness:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v8;
  OZChannelDouble *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  CMTime *v17;
  OZChannel *v18;
  OZChannel *v19;
  int32_t v20;
  CMTime *v21;
  int32_t v22;
  CMTime *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  PVTransformAnimation *v38;
  id obj;
  id obja;
  _OWORD v41[3];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CMTime v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CMTime v53;
  CMTime v54;
  CMTime time2;
  CMTime time1;
  CMTime v57;
  __int128 v58;
  uint64_t v59;
  CMTime v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  PCString v65[2];
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v6 = *(_QWORD *)&a6;
  v8 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v73.receiver = self;
  v73.super_class = (Class)PVTransformAnimation;
  v38 = -[PVTransformAnimation init](&v73, sel_init, 0);
  if (v38)
  {
    if (v8 && objc_msgSend(obj, "count"))
    {
      v10 = (OZChannelDouble *)operator new();
      PCString::PCString(v65, "Transform Scale Chan");
      OZChannelDouble::OZChannelDouble(v10, v65, 0, 0, 65538, 0, 0);
      PCString::~PCString(v65);
      v11 = operator new();
      PCString::PCString(v65, "Transform Pan Channel");
      OZChannel2D::OZChannel2D((OZChannel2D *)v11, v65, 0, 0, 0x10002u, 2u, 0, 0);
      PCString::~PCString(v65);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      obja = obj;
      v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v70 != v13)
              objc_enumerationMutation(obja);
            v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            v68 = 0;
            v66 = 0u;
            v67 = 0u;
            *(_OWORD *)&v65[0].var0 = 0u;
            if (v15)
            {
              objc_msgSend(v15, "PVTransformAnimationInfoValue");
              v16 = *((double *)&v67 + 1);
            }
            else
            {
              v16 = 0.0;
            }
            *(_OWORD *)&v64.value = *(_OWORD *)&v65[0].var0;
            v64.epoch = v66;
            OZChannel::appendKeyframe((OZChannel *)v10, &v64, v16);
            OZChannel::appendKeyframe((OZChannel *)(v11 + 136), &v64, *((double *)&v66 + 1));
            OZChannel::appendKeyframe((OZChannel *)(v11 + 288), &v64, *(double *)&v67);
          }
          v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        }
        while (v12);
      }

      v17 = (CMTime *)MEMORY[0x1E0CA2E68];
      v64 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v63 = v64;
      memset(&v62, 0, sizeof(v62));
      CMTimeMake(&v62, 1, 30);
      OZChannel::getKeyframeMinTime((OZChannel *)v10, (uint64_t)v65);
      *(_OWORD *)&v64.value = *(_OWORD *)&v65[0].var0;
      v64.epoch = v66;
      OZChannel::getKeyframeMaxTime((OZChannel *)v10, (uint64_t)v65);
      *(_OWORD *)&v63.value = *(_OWORD *)&v65[0].var0;
      v63.epoch = v66;
      (*(void (**)(OZChannelDouble *, CMTime *, CMTime *, CMTime *, uint64_t, uint64_t, uint64_t, double))(*(_QWORD *)v10 + 376))(v10, &v64, &v63, &v62, 2, v6, 1, a5);
      v60 = *v17;
      v57 = v60;
      v18 = (OZChannel *)(v11 + 136);
      OZChannel::getKeyframeMinTime((OZChannel *)(v11 + 136), (uint64_t)v65);
      *(_OWORD *)&v61.value = *(_OWORD *)&v65[0].var0;
      v61.epoch = v66;
      v19 = (OZChannel *)(v11 + 288);
      OZChannel::getKeyframeMinTime((OZChannel *)(v11 + 288), (uint64_t)v65);
      v58 = *(_OWORD *)&v65[0].var0;
      v59 = v66;
      time1 = v61;
      *(_OWORD *)&time2.value = *(_OWORD *)&v65[0].var0;
      time2.epoch = v66;
      v20 = CMTimeCompare(&time1, &time2);
      v21 = (CMTime *)&v58;
      if (v20 < 0)
        v21 = &v61;
      v64 = *v21;
      OZChannel::getKeyframeMaxTime((OZChannel *)(v11 + 136), (uint64_t)v65);
      *(_OWORD *)&v60.value = *(_OWORD *)&v65[0].var0;
      v60.epoch = v66;
      OZChannel::getKeyframeMaxTime((OZChannel *)(v11 + 288), (uint64_t)v65);
      *(_OWORD *)&v57.value = *(_OWORD *)&v65[0].var0;
      v57.epoch = v66;
      v54 = v60;
      *(_OWORD *)&v53.value = *(_OWORD *)&v65[0].var0;
      v53.epoch = v66;
      v22 = CMTimeCompare(&v54, &v53);
      v23 = &v57;
      if (v22 > 0)
        v23 = &v60;
      v63 = *v23;
      (*(void (**)(uint64_t, CMTime *, CMTime *, CMTime *, uint64_t, uint64_t, uint64_t, double))(*(_QWORD *)v11 + 376))(v11, &v64, &v63, &v62, 2, v6, 1, a5);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v25 = obja;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v50 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
            v68 = 0;
            v66 = 0u;
            v67 = 0u;
            *(_OWORD *)&v65[0].var0 = 0u;
            if (v29)
              objc_msgSend(v29, "PVTransformAnimationInfoValue");
            *(_OWORD *)&v48.value = *(_OWORD *)&v65[0].var0;
            v48.epoch = v66;
            OZChannel::getValueAsDouble((OZChannel *)v10, &v48, 0.0);
            v31 = v30;
            OZChannel::getValueAsDouble(v18, &v48, 0.0);
            v33 = v32;
            OZChannel::getValueAsDouble(v19, &v48, 0.0);
            v42 = *(_OWORD *)&v65[0].var0;
            v43 = v66;
            v44 = v33;
            v45 = v34;
            v46 = v31;
            v47 = 0;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPVTransformAnimationInfo:", &v42);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v35);

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
        }
        while (v26);
      }

    }
    else
    {
      v24 = obj;
    }
    v36 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v41[0] = *MEMORY[0x1E0CA2E40];
    v41[1] = v36;
    v41[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    obj = v24;
    -[PVTransformAnimation _commonInit:liveTransform:presentationTimeRange:](v38, "_commonInit:liveTransform:presentationTimeRange:", v24, 0, v41, v38);
  }

  return v38;
}

- (PVTransformAnimation)initWithAnimationInfo:(PVTransformAnimationInfo *)a3
{
  __int128 v4;
  void *v5;
  PVTransformAnimation *v6;
  void *v7;
  PVTransformAnimation *v8;
  _OWORD v10[3];
  double rotation;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->time.epoch;
  v10[0] = *(_OWORD *)&a3->time.value;
  v10[1] = v4;
  v10[2] = *(_OWORD *)&a3->translation.y;
  rotation = a3->rotation;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPVTransformAnimationInfo:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PVTransformAnimation alloc];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PVTransformAnimation initWithAnimation:](v6, "initWithAnimation:", v7);

  return v8;
}

- (PVTransformAnimation)initWithAnimation:(id)a3
{
  return -[PVTransformAnimation initWithAnimation:simplify:tolerance:smoothness:](self, "initWithAnimation:simplify:tolerance:smoothness:", a3, 0, 0, 4.0);
}

- (PVTransformAnimation)initWithLiveTransform:(PVTransformAnimationInfo *)a3
{
  PVTransformAnimation *v4;
  PVTransformAnimation *v5;
  __int128 v6;
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVTransformAnimation;
  v4 = -[PVTransformAnimation init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v8[0] = *MEMORY[0x1E0CA2E40];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    -[PVTransformAnimation _commonInit:liveTransform:presentationTimeRange:](v4, "_commonInit:liveTransform:presentationTimeRange:", 0, a3, v8);
  }
  return v5;
}

- (PVTransformAnimation)initWithAnimation:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5
{
  id v8;
  PVTransformAnimation *v9;
  PVTransformAnimation *v10;
  __int128 v11;
  __int128 v12;

  v8 = a3;
  if (a4)
    v9 = -[PVTransformAnimation initWithLiveTransform:](self, "initWithLiveTransform:", a4);
  else
    v9 = -[PVTransformAnimation initWithAnimation:](self, "initWithAnimation:", v8);
  v10 = v9;
  if (v9)
  {
    v11 = *(_OWORD *)&a5->var0.var0;
    v12 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v9->_presentationTimeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v9->_presentationTimeRange.duration.timescale = v12;
    *(_OWORD *)&v9->_presentationTimeRange.start.value = v11;
  }

  return v10;
}

- (void)_commonInit:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5
{
  __int128 v8;
  __int128 v9;

  objc_storeStrong((id *)&self->_animationData, a3);
  self->_liveTransform = a4;
  v8 = *(_OWORD *)&a5->var0.var0;
  v9 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)&self->_presentationTimeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&self->_presentationTimeRange.duration.timescale = v9;
  *(_OWORD *)&self->_presentationTimeRange.start.value = v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PVTransformAnimation;
  -[PVTransformAnimation dealloc](&v2, sel_dealloc);
}

- (PVTransformAnimationInfo)transformInfoAtTime:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  PVTransformAnimationInfo *v8;
  int64_t *p_epoch;
  uint64_t v10;
  void *v11;
  int32_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  int v22;
  _OWORD *p_y;
  void *v24;
  id obj;
  void *v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime time;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  _BYTE v45[32];
  __int128 v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  retstr->translation.x = 0.0;
  retstr->translation.y = 0.0;
  *(_OWORD *)&retstr->scale = xmmword_1B304EED0;
  retstr->time = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
  v5 = *(_QWORD *)&self->time.timescale;
  if (v5)
  {
    v6 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->time.value = *(_OWORD *)v5;
    *(_OWORD *)&retstr->time.epoch = v6;
    *(_OWORD *)&retstr->translation.y = *(_OWORD *)(v5 + 32);
    retstr->rotation = *(double *)(v5 + 48);
    return self;
  }
  v8 = self;
  p_epoch = &self->time.epoch;
  v10 = objc_msgSend((id)self->time.epoch, "count");
  objc_msgSend((id)*p_epoch, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend((id)*p_epoch, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "PVTransformAnimationInfoValue");
  }
  else
  {
    v47 = 0.0;
    v46 = 0u;
    memset(v45, 0, sizeof(v45));
  }
  v52 = *(_OWORD *)v45;
  v53 = *(_OWORD *)&v45[16];
  v54 = v46;
  v55 = v47;
  time1 = *(CMTime *)v45;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v12 = CMTimeCompare(&time1, &time2);
  p_y = (_OWORD *)&v8->translation.y;
  if ((BYTE4(v8->scale) & 1) != 0
    && (v8[1].time.flags & 1) != 0
    && !v8[1].time.epoch
    && (v8[1].time.value & 0x8000000000000000) == 0)
  {
    *(_OWORD *)&lhs.value = v52;
    lhs.epoch = v53;
    *(_OWORD *)&rhs.value = *p_y;
    rhs.epoch = *(_QWORD *)&v8->rotation;
    CMTimeAdd((CMTime *)v45, &lhs, &rhs);
    v52 = *(_OWORD *)v45;
    *(_QWORD *)&v53 = *(_QWORD *)&v45[16];
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)v8->time.epoch;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
  if (!v13)
  {
    v14 = 0;
    goto LABEL_45;
  }
  v22 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (v17)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "PVTransformAnimationInfoValue");
      }
      else
      {
        v47 = 0.0;
        v46 = 0u;
        memset(v45, 0, sizeof(v45));
      }
      v18 = *(_OWORD *)&v45[16];
      *(_OWORD *)&retstr->time.value = *(_OWORD *)v45;
      *(_OWORD *)&retstr->time.epoch = v18;
      *(_OWORD *)&retstr->translation.y = v46;
      retstr->rotation = v47;
      if ((BYTE4(v8->scale) & 1) != 0
        && (v8[1].time.flags & 1) != 0
        && !v8[1].time.epoch
        && (v8[1].time.value & 0x8000000000000000) == 0)
      {
        time = (CMTime)retstr->time;
        *(_OWORD *)&v35.value = *p_y;
        v35.epoch = *(_QWORD *)&v8->rotation;
        CMTimeAdd((CMTime *)v45, &time, &v35);
        *(_OWORD *)&retstr->time.value = *(_OWORD *)v45;
        retstr->time.epoch = *(_QWORD *)&v45[16];
      }
      if (v10 == 1)
      {
        v14 = 0;
        *(_OWORD *)&retstr->time.value = *(_OWORD *)&a4->var0;
        retstr->time.epoch = a4->var3;
LABEL_44:
        v11 = v24;
        goto LABEL_45;
      }
      if (v17 == v26)
        goto LABEL_44;
      v34 = (CMTime)*a4;
      *(_OWORD *)&v33.value = v52;
      v33.epoch = v53;
      if (CMTimeCompare(&v34, &v33) < 0)
      {
        if (v22 >= 1)
        {
          v20 = *MEMORY[0x1E0CA2E68];
          *(_OWORD *)&v45[16] = *(unint64_t *)(MEMORY[0x1E0CA2E68] + 16);
          retstr->translation.y = 0.0;
          v21 = *(_OWORD *)&v45[16];
          *(_OWORD *)&retstr->time.value = v20;
          *(_OWORD *)&retstr->time.epoch = v21;
          *(_OWORD *)&retstr->scale = xmmword_1B304EED0;
        }
        goto LABEL_44;
      }
      objc_msgSend((id)v8->time.epoch, "objectAtIndex:", objc_msgSend((id)v8->time.epoch, "indexOfObject:", v17) + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v19;
      if (v19)
      {
        objc_msgSend(v19, "PVTransformAnimationInfoValue");
      }
      else
      {
        v47 = 0.0;
        v46 = 0u;
        memset(v45, 0, sizeof(v45));
      }
      v48 = *(_OWORD *)v45;
      v49 = *(_OWORD *)&v45[16];
      v50 = v46;
      v51 = v47;
      if ((BYTE4(v8->scale) & 1) != 0
        && (v8[1].time.flags & 1) != 0
        && !v8[1].time.epoch
        && (v8[1].time.value & 0x8000000000000000) == 0)
      {
        *(_OWORD *)&v32.value = v48;
        v32.epoch = v49;
        *(_OWORD *)&v31.value = *p_y;
        v31.epoch = *(_QWORD *)&v8->rotation;
        CMTimeAdd((CMTime *)v45, &v32, &v31);
        v48 = *(_OWORD *)v45;
        *(_QWORD *)&v49 = *(_QWORD *)&v45[16];
      }
      v30 = (CMTime)*a4;
      v29 = (CMTime)retstr->time;
      if ((CMTimeCompare(&v30, &v29) & 0x80000000) == 0)
      {
        v28 = (CMTime)*a4;
        *(_OWORD *)&v27.value = v48;
        v27.epoch = v49;
        if (CMTimeCompare(&v28, &v27) < 0)
          goto LABEL_44;
      }
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
    v11 = v24;
    if (v13)
      continue;
    break;
  }
LABEL_45:

  return self;
}

- (PVTransformAnimationInfo)transformInfoAtLocalTime:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  PVTransformAnimationInfo *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  CMTime time;
  CMTime time2;
  CMTime time1;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  retstr->translation.x = 0.0;
  retstr->translation.y = 0.0;
  *(_OWORD *)&retstr->scale = xmmword_1B304EED0;
  retstr->time = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
  v5 = *(_QWORD *)&self->time.timescale;
  if (v5)
  {
    v6 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->time.value = *(_OWORD *)v5;
    *(_OWORD *)&retstr->time.epoch = v6;
    *(_OWORD *)&retstr->translation.y = *(_OWORD *)(v5 + 32);
    retstr->rotation = *(double *)(v5 + 48);
  }
  else
  {
    v8 = self;
    v9 = objc_msgSend((id)self->time.epoch, "count");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = (id)v8->time.epoch;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (v14)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "PVTransformAnimationInfoValue");
          }
          else
          {
            v27 = 0.0;
            v25 = 0u;
            v26 = 0u;
            v24 = 0u;
          }
          v15 = v25;
          *(_OWORD *)&retstr->time.value = v24;
          *(_OWORD *)&retstr->time.epoch = v15;
          *(_OWORD *)&retstr->translation.y = v26;
          retstr->rotation = v27;
          if (v9 == 1)
            goto LABEL_19;
          time1 = (CMTime)retstr->time;
          time2 = (CMTime)*a4;
          if (!CMTimeCompare(&time1, &time2))
            goto LABEL_20;
          time = (CMTime)retstr->time;
          v20 = (CMTime)*a4;
          if (CMTimeCompare(&time, &v20) >= 1)
          {
            objc_msgSend((id)v8->time.epoch, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v14 == v16;

            if (!v17)
              goto LABEL_20;
            v18 = *MEMORY[0x1E0CA2E68];
            v25 = *(unint64_t *)(MEMORY[0x1E0CA2E68] + 16);
            retstr->translation.y = 0.0;
            v19 = v25;
            *(_OWORD *)&retstr->time.value = v18;
            *(_OWORD *)&retstr->time.epoch = v19;
            *(_OWORD *)&retstr->scale = xmmword_1B304EED0;
LABEL_19:
            *(_OWORD *)&retstr->time.value = *(_OWORD *)&a4->var0;
            retstr->time.epoch = a4->var3;
            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_20:

  }
  return self;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5
{
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  char v13;
  BOOL v14;
  __int128 v16;
  int64_t var3;
  __int128 v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  int64_t v25;

  v7 = a3;
  v8 = v7;
  v24 = *MEMORY[0x1E0CA2E68];
  v25 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (v7)
  {
    v16 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v7, "transformInfoAtTime:", &v16);
    v24 = v18;
    v25 = v19;
    v10 = v20;
    v9 = v21;
    v11 = v22;
    v12 = v23;
    v13 = 1;
    if (v20 > -0.0000001 && v20 < 0.0000001 && v21 > -0.0000001 && v21 < 0.0000001 && fabs(v22 + -1.0) < 0.0001)
    {
      v14 = v23 > -0.0000001;
      if (v23 >= 0.0000001)
        v14 = 0;
      v13 = !v14;
    }
  }
  else
  {
    v13 = 0;
    v11 = 1.0;
    v12 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }
  if (a5)
  {
    *(_OWORD *)&a5->time.value = v24;
    a5->time.epoch = v25;
    a5->translation.x = v10;
    a5->translation.y = v9;
    a5->scale = v11;
    a5->rotation = v12;
  }

  return v13 & 1;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5
{
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  char v13;
  BOOL v14;
  __int128 v16;
  int64_t var3;
  __int128 v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  int64_t v25;

  v7 = a3;
  v8 = v7;
  v24 = *MEMORY[0x1E0CA2E68];
  v25 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (v7)
  {
    v16 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v7, "transformInfoAtLocalTime:", &v16);
    v24 = v18;
    v25 = v19;
    v10 = v20;
    v9 = v21;
    v11 = v22;
    v12 = v23;
    v13 = 1;
    if (v20 > -0.0000001 && v20 < 0.0000001 && v21 > -0.0000001 && v21 < 0.0000001 && fabs(v22 + -1.0) < 0.0001)
    {
      v14 = v23 > -0.0000001;
      if (v23 >= 0.0000001)
        v14 = 0;
      v13 = !v14;
    }
  }
  else
  {
    v13 = 0;
    v11 = 1.0;
    v12 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }
  if (a5)
  {
    *(_OWORD *)&a5->time.value = v24;
    a5->time.epoch = v25;
    a5->translation.x = v10;
    a5->translation.y = v9;
    a5->scale = v11;
    a5->rotation = v12;
  }

  return v13 & 1;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8
{
  _BOOL8 v9;
  uint64_t v10;
  double height;
  double width;
  id v15;
  char v16;
  char v17;
  float64_t v18;
  float64x2_t v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  height = a5.height;
  width = a5.width;
  v15 = a3;
  v21 = *a4;
  v16 = objc_msgSend(a1, "getTransformInfoFromAnimation:atTime:outInfo:", v15, &v21, a8);
  v17 = v16 ^ 1;
  if (!a8)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v15, "basisForRenderSize:contentMode:invertY:", v10, v9, width, height);
    v19.f64[1] = v18;
    a8->translation = (CGPoint)vmulq_f64(v19, (float64x2_t)a8->translation);
  }

  return v16;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8
{
  _BOOL8 v9;
  uint64_t v10;
  double height;
  double width;
  id v15;
  char v16;
  char v17;
  float64_t v18;
  float64x2_t v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  height = a5.height;
  width = a5.width;
  v15 = a3;
  v21 = *a4;
  v16 = objc_msgSend(a1, "getTransformInfoFromAnimation:atLocalTime:outInfo:", v15, &v21, a8);
  v17 = v16 ^ 1;
  if (!a8)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v15, "basisForRenderSize:contentMode:invertY:", v10, v9, width, height);
    v19.f64[1] = v18;
    a8->translation = (CGPoint)vmulq_f64(v19, (float64x2_t)a8->translation);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVTransformAnimation)initWithCoder:(id)a3
{
  id v4;
  PVTransformAnimation *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSArray *animationData;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  double v19;
  CMTimeRange v21;
  id v22;

  v4 = a3;
  if (-[PVTransformAnimation initWithCoder:]::onceToken != -1)
    dispatch_once(&-[PVTransformAnimation initWithCoder:]::onceToken, &__block_literal_global_8);
  v5 = (PVTransformAnimation *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVTransformAnimation_CodingVersion"));
    if (v6 >= 1)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[PVTransformAnimation initWithCoder:]::whitelist, CFSTR("PVTransformAnimation_AnimationData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVTransformAnimation animationInfoFromData:](v5, "animationInfoFromData:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      animationData = v5->_animationData;
      v5->_animationData = (NSArray *)v8;

      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v14, CFSTR("PVTransformAnimation_PresentationTimeRange"), &v22);
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v16 = v22;

      if (v15)
      {
        CMTimeRangeMakeFromDictionary(&v21, v15);
        v17 = *(_OWORD *)&v21.duration.timescale;
        v18 = *(_OWORD *)&v21.start.epoch;
        *(_OWORD *)&v5->_presentationTimeRange.start.value = *(_OWORD *)&v21.start.value;
        *(_OWORD *)&v5->_presentationTimeRange.start.epoch = v18;
        *(_OWORD *)&v5->_presentationTimeRange.duration.timescale = v17;
      }

      if (v6 >= 2)
      {
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PVTransformAnimation_AspectRatio"));
        v5->_aspectRatio = v19;
      }
    }
  }

  return v5;
}

void __38__PVTransformAnimation_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[PVTransformAnimation initWithCoder:]::whitelist;
  -[PVTransformAnimation initWithCoder:]::whitelist = v2;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  CFDictionaryRef v7;
  CMTimeRange v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("PVTransformAnimation_CodingVersion"));
  -[PVTransformAnimation dataFromAnimationInfo:](self, "dataFromAnimationInfo:", self->_animationData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PVTransformAnimation_AnimationData"));

  v6 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  *(_OWORD *)&v8.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value;
  *(_OWORD *)&v8.start.epoch = v6;
  *(_OWORD *)&v8.duration.timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  v7 = CMTimeRangeCopyAsDictionary(&v8, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PVTransformAnimation_PresentationTimeRange"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("PVTransformAnimation_AspectRatio"), self->_aspectRatio);

}

- (id)animationInfoFromData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  id obj;
  _OWORD v22[3];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v20;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v31;
      v7 = *MEMORY[0x1E0CB2CD0];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v10 = objc_alloc(MEMORY[0x1E0CB3710]);
          v29 = 0;
          v11 = (void *)objc_msgSend(v10, "initForReadingFromData:error:", v9, &v29);
          v12 = v29;
          v13 = (void *)MEMORY[0x1E0C99E60];
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          v34[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0;
          objc_msgSend(v11, "decodeTopLevelObjectOfClasses:forKey:error:", v15, v7, &v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v28;
          objc_msgSend(v11, "finishDecoding");
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
          v24 = 0u;
          if (v16)
            objc_msgSend(v16, "PVTransformAnimationInfo");
          v22[0] = v24;
          v22[1] = v25;
          v22[2] = v26;
          v23 = v27;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPVTransformAnimationInfo:", v22, v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v5);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dataFromAnimationInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id obj;
  _OWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v14;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v23;
      v7 = *MEMORY[0x1E0CB2CD0];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 0;
          v19 = 0u;
          v20 = 0u;
          v18 = 0u;
          if (v9)
            objc_msgSend(v9, "PVTransformAnimationInfoValue");
          v16[0] = v18;
          v16[1] = v19;
          v16[2] = v20;
          v17 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithPVTransformAnimationInfo:", v16, v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
          objc_msgSend(v11, "encodeObject:forKey:", v10, v7);
          objc_msgSend(v11, "finishEncoding");
          objc_msgSend(v11, "encodedData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v5);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *animationData;
  void *v5;
  NSArray *v6;
  id v7;
  void *v8;
  PVTransformAnimation *v9;
  PVTransformAnimationInfo *liveTransform;
  __int128 v11;
  PVTransformAnimation *v12;
  _OWORD v14[3];
  _QWORD v15[4];
  id v16;

  animationData = self->_animationData;
  if (animationData)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](animationData, "count", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_animationData;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__PVTransformAnimation_copyWithZone___block_invoke;
    v15[3] = &unk_1E64D55F0;
    v7 = v5;
    v16 = v7;
    -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v15);
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = 0;
  }
  v9 = [PVTransformAnimation alloc];
  liveTransform = self->_liveTransform;
  v11 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  v14[0] = *(_OWORD *)&self->_presentationTimeRange.start.value;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  v12 = -[PVTransformAnimation initWithAnimation:liveTransform:presentationTimeRange:](v9, "initWithAnimation:liveTransform:presentationTimeRange:", v8, liveTransform, v14);
  -[PVTransformAnimation aspectRatio](self, "aspectRatio");
  -[PVTransformAnimation setAspectRatio:](v12, "setAspectRatio:");

  return v12;
}

void __37__PVTransformAnimation_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:");

}

- (CGSize)basisForRenderSize:(CGSize)a3 contentMode:(int)a4
{
  double v4;
  double v5;
  CGSize result;

  -[PVTransformAnimation basisForRenderSize:contentMode:invertY:](self, "basisForRenderSize:contentMode:invertY:", *(_QWORD *)&a4, 0, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)basisForRenderSize:(CGSize)result contentMode:(int)a4 invertY:(BOOL)a5
{
  double aspectRatio;
  double v6;
  double height;

  if (a4)
  {
    if (a4 != 3)
    {
      aspectRatio = self->_aspectRatio;
      if (aspectRatio <= -0.0000001 || aspectRatio >= 0.0000001)
      {
        if (a4 <= 2)
        {
          if (a4 == 1)
          {
            if (result.width <= result.height)
            {
              height = result.height;
              if (result.height * aspectRatio < result.width)
                height = result.width / aspectRatio;
            }
            else
            {
              height = result.width / aspectRatio;
              if (result.width / aspectRatio < result.height)
                height = result.height;
            }
            result.width = aspectRatio * height;
            result.height = height;
          }
          else if (a4 == 2)
          {
            v6 = result.width / aspectRatio;
            if (v6 <= result.height)
              result.height = v6;
            result.width = aspectRatio * result.height;
          }
          else
          {
            result.width = self->_aspectRatio;
            result.height = 1.0;
          }
        }
        else if (a4 == 13)
        {
          result.height = result.width / aspectRatio;
        }
        else
        {
          result.width = result.height * aspectRatio;
          if (a4 != 14)
          {
            result.width = self->_aspectRatio;
            result.height = 1.0;
          }
        }
      }
    }
  }
  if (a5)
    result.height = -result.height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PVTransformAnimation *v4;
  PVTransformAnimation *v5;
  PVTransformAnimation *v6;
  double aspectRatio;
  double v8;
  __int128 v9;
  NSArray *animationData;
  void *v11;
  char v12;
  CMTimeRange v14;
  CMTimeRange range1;

  v4 = (PVTransformAnimation *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    aspectRatio = self->_aspectRatio;
    -[PVTransformAnimation aspectRatio](v6, "aspectRatio");
    if (vabdd_f64(aspectRatio, v8) < 0.0001
      && (v9 = *(_OWORD *)&self->_presentationTimeRange.start.epoch,
          *(_OWORD *)&range1.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value,
          *(_OWORD *)&range1.start.epoch = v9,
          *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale,
          -[PVTransformAnimation presentationTimeRange](v6, "presentationTimeRange"),
          CMTimeRangeEqual(&range1, &v14)))
    {
      animationData = self->_animationData;
      -[PVTransformAnimation animationData](v6, "animationData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSArray isEqualToArray:](animationData, "isEqualToArray:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_7:
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  uint64_t timescale;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *animationData;
  unint64_t v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = -[NSArray hash](self->_animationData, "hash");
  timescale = self->_presentationTimeRange.start.timescale;
  if ((_DWORD)timescale)
    v4 = ((self->_presentationTimeRange.start.value << 10) / timescale);
  else
    v4 = 0;
  v5 = v16;
  v6 = v16[3] ^ v4;
  v16[3] = v6;
  v7 = self->_presentationTimeRange.duration.timescale;
  if ((_DWORD)v7)
    v8 = ((self->_presentationTimeRange.duration.value << 10) / v7);
  else
    v8 = 0;
  v5[3] = v8 ^ v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_aspectRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v16[3] ^= v10;

  animationData = self->_animationData;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__PVTransformAnimation_hash__block_invoke;
  v14[3] = &unk_1E64D5618;
  v14[4] = &v15;
  -[NSArray enumerateObjectsUsingBlock:](animationData, "enumerateObjectsUsingBlock:", v14);
  v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __28__PVTransformAnimation_hash__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= objc_msgSend(v3, "hash");

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSArray *animationData;
  id v11;
  _QWORD v13[4];
  id v14;
  CMTimeRange range;
  objc_super v16;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v16.receiver = self;
  v16.super_class = (Class)PVTransformAnimation;
  -[PVTransformAnimation description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v6 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  v7 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" presentationTimeRange = %@\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aspectRatio = %.3f\n"), *(_QWORD *)&self->_aspectRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v9);

  animationData = self->_animationData;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__PVTransformAnimation_description__block_invoke;
  v13[3] = &unk_1E64D5640;
  v11 = v5;
  v14 = v11;
  -[NSArray enumerateObjectsUsingBlock:](animationData, "enumerateObjectsUsingBlock:", v13);

  return v11;
}

void __35__PVTransformAnimation_description__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  v4 = v3;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (v3)
    objc_msgSend(v3, "PVTransformAnimationInfoValue");
  v5 = *(void **)(a1 + 32);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  NSStringFromPVTransformAnimationInfo((uint64_t)v7, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (NSArray)animationData
{
  return self->_animationData;
}

- ($202A6A048D39AE170264FF71A65A9479)presentationTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setPresentationTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_presentationTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_presentationTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_presentationTimeRange.start.value = v3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationData, 0);
}

@end
