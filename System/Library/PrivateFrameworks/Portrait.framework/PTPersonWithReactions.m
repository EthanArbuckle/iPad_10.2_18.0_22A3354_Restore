@implementation PTPersonWithReactions

- (PTPersonWithReactions)initWithIdentifier:(id)a3
{
  id v5;
  PTPersonWithReactions *v6;
  PTPersonWithReactions *v7;
  uint64_t v8;
  PTPersonReactionSlot *v9;
  double v10;
  double v11;
  uint64_t v12;
  PTPersonReactionSlot *leftHandSlot;
  PTPersonReactionSlot *v14;
  double v15;
  double v16;
  uint64_t v17;
  PTPersonReactionSlot *rightHandSlot;
  PTPersonReactionSlot *v19;
  double v20;
  double v21;
  uint64_t v22;
  PTPersonReactionSlot *bothHandsSlot;
  PTHandGesture *v24;
  uint64_t v25;
  PTHandGesture *unknownGesture;
  PTPersonWithReactions *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTPersonWithReactions;
  v6 = -[PTPersonWithReactions init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_numFramesInactive = 0;
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v7->_lastTwoHandReactionEndTime.value = *MEMORY[0x1E0CA2E18];
    v7->_lastTwoHandReactionEndTime.epoch = *(_QWORD *)(v8 + 16);
    v9 = [PTPersonReactionSlot alloc];
    LODWORD(v10) = 1128136704;
    LODWORD(v11) = 1128136704;
    v12 = -[PTPersonReactionSlot initWithStartTime:stopTime:](v9, "initWithStartTime:stopTime:", v10, v11);
    leftHandSlot = v7->_leftHandSlot;
    v7->_leftHandSlot = (PTPersonReactionSlot *)v12;

    v14 = [PTPersonReactionSlot alloc];
    LODWORD(v15) = 1128136704;
    LODWORD(v16) = 1128136704;
    v17 = -[PTPersonReactionSlot initWithStartTime:stopTime:](v14, "initWithStartTime:stopTime:", v15, v16);
    rightHandSlot = v7->_rightHandSlot;
    v7->_rightHandSlot = (PTPersonReactionSlot *)v17;

    v19 = [PTPersonReactionSlot alloc];
    LODWORD(v20) = 1128136704;
    LODWORD(v21) = 1128136704;
    v22 = -[PTPersonReactionSlot initWithStartTime:stopTime:](v19, "initWithStartTime:stopTime:", v20, v21);
    bothHandsSlot = v7->_bothHandsSlot;
    v7->_bothHandsSlot = (PTPersonReactionSlot *)v22;

    v7->_bothHandsDetected = 0;
    v24 = [PTHandGesture alloc];
    v25 = -[PTHandGesture initWithType:chirality:boundingBox:confidence:personID:handID:](v24, "initWithType:chirality:boundingBox:confidence:personID:handID:", 0, 1, &unk_1E8252ED8, &unk_1E8251DE8, &unk_1E8251DE8, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    unknownGesture = v7->_unknownGesture;
    v7->_unknownGesture = (PTHandGesture *)v25;

    v27 = v7;
  }

  return v7;
}

- (NSArray)reactions
{
  void *v3;
  uint64_t v4;
  PTPersonReactionSlot *v5;
  void *v6;
  void *v7;
  uint64_t i;
  PTPersonReactionSlot *v10;
  PTPersonReactionSlot *v11;
  PTPersonReactionSlot *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_leftHandSlot;
  v11 = self->_rightHandSlot;
  v4 = 0;
  v12 = self->_bothHandsSlot;
  do
  {
    v5 = *(PTPersonReactionSlot **)((char *)&v10 + v4);
    -[PTPersonReactionSlot reaction](v5, "reaction", v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PTPersonReactionSlot reaction](v5, "reaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    v4 += 8;
  }
  while (v4 != 24);
  for (i = 16; i != -8; i -= 8)

  return (NSArray *)v3;
}

- (void)_stopActiveGestureOnSlot:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "setActiveGestureType:", 0);
  v8 = *MEMORY[0x1E0CA2E18];
  v5 = v8;
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v4 = v9;
  objc_msgSend(v3, "setActiveGestureLastSeenTime:", &v8);
  v6 = v5;
  v7 = v4;
  objc_msgSend(v3, "setLatestGestureFirstSeenTime:", &v6);

}

- (void)updateWithLeftHand:(id)a3 rightHand:(id)a4 timeStamp:(id *)a5
{
  PTHandGesture *v8;
  id v9;
  PTHandGesture *v10;
  BOOL v11;
  BOOL v12;
  PTPersonReactionSlot *bothHandsSlot;
  PTPersonReactionSlot *leftHandSlot;
  PTPersonReactionSlot *rightHandSlot;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  int64_t var3;

  v8 = (PTHandGesture *)a3;
  v9 = a4;
  if ((unint64_t)v8 | (unint64_t)v9)
  {
    v10 = (PTHandGesture *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    v12 = !v11;
    self->_bothHandsDetected = v12;
    if (v8)
    {
      if (v9)
      {
LABEL_10:
        bothHandsSlot = self->_bothHandsSlot;
        v18 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        -[PTPersonWithReactions _updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:](self, "_updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:", bothHandsSlot, v10, v8, &v18);
        leftHandSlot = self->_leftHandSlot;
        v18 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        -[PTPersonWithReactions _updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:](self, "_updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:", leftHandSlot, v8, 0, &v18);
        rightHandSlot = self->_rightHandSlot;
        v18 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        -[PTPersonWithReactions _updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:](self, "_updateReactionSlot:withOneHand:optionalOtherHand:timeStamp:", rightHandSlot, v10, 0, &v18);

        goto LABEL_13;
      }
    }
    else
    {
      v8 = self->_unknownGesture;
      if (v10)
        goto LABEL_10;
    }
    v10 = self->_unknownGesture;
    goto LABEL_10;
  }
  _PTLogSystem();
  v8 = (PTHandGesture *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    -[PTPersonWithReactions updateWithLeftHand:rightHand:timeStamp:].cold.1(&v8->super, v16, v17);
LABEL_13:

}

- (id)createReactionWithType:(unint64_t)a3
{
  PTEffectReaction *v5;

  v5 = objc_alloc_init(PTEffectReaction);
  -[PTEffectReaction setEffectType:](v5, "setEffectType:", a3);
  -[PTEffectReaction setTriggerID:](v5, "setTriggerID:", (*self->_reactionTriggerID)++);
  return v5;
}

- (void)_updateReactionSlot:(id)a3 withOneHand:(id)a4 optionalOtherHand:(id)a5 timeStamp:(id *)a6
{
  PTPersonReactionSlot *v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  CGFloat MidY;
  float64x2_t v17;
  float32x2_t v18;
  uint64_t v19;
  CGFloat v20;
  float64x2_t v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  Float64 v34;
  __int128 v35;
  void *v36;
  float v37;
  float v38;
  float DurationMilliseconds;
  float v40;
  float v41;
  float v42;
  float v43;
  unsigned int v44;
  void *v45;
  CGFloat v46;
  float64x2_t v47;
  double v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  Float64 Seconds;
  CGFloat MidX;
  CGFloat v62;
  CGFloat v63;
  CMTime v64;
  __int128 v65;
  int64_t v66;
  __int128 v67;
  int64_t var3;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v73;
  CMTime v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE time[28];
  uint64_t v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v79 = *MEMORY[0x1E0C80C00];
  v10 = (PTPersonReactionSlot *)a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "type");
  v14 = -[PTPersonReactionSlot latestGestureType](v10, "latestGestureType");
  v15 = -[PTPersonReactionSlot activeGestureType](v10, "activeGestureType");
  objc_msgSend(v11, "boundingBox");
  MidX = CGRectGetMidX(v80);
  objc_msgSend(v11, "boundingBox");
  MidY = CGRectGetMidY(v81);
  v17.f64[0] = MidX;
  v17.f64[1] = MidY;
  v18 = vcvt_f32_f64(v17);
  if (!v15)
  {
    if (v12)
    {
      if (CanTriggerTwoHandReaction(v11, v12, 0.7))
        v13 = v13;
      else
        v13 = 0;
    }
    else
    {
      if ((v13 & 0xFFFFFFFE) == 2)
        v25 = flt_1C9322D60[!self->_bothHandsDetected];
      else
        v25 = 0.7;
      objc_msgSend(v11, "confidence");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v38 = v37;

      if (v38 >= v25)
        v13 = v13;
      else
        v13 = 0;
    }
    -[PTPersonReactionSlot setLatestGestureType:](v10, "setLatestGestureType:", v13);
    if (v14 == (_DWORD)v13 && (v14 - 1 < 4 || v14 == 6))
    {
      if (v10)
      {
        -[PTPersonReactionSlot latestGestureFirstSeenTime](v10, "latestGestureFirstSeenTime");
        if ((v76 & 0x100000000) != 0)
        {
          -[PTPersonReactionSlot latestGestureFirstSeenTime](v10, "latestGestureFirstSeenTime");
          *(_OWORD *)time = *(_OWORD *)&a6->var0;
          *(_QWORD *)&time[16] = a6->var3;
          DurationMilliseconds = GetDurationMilliseconds(&v74, (CMTime *)time);
          -[PTPersonReactionSlot milliSecondsToStart](v10, "milliSecondsToStart");
          v41 = v40;
          if (!v12)
          {
            if (self->_bothHandsDetected && (v14 - 1 < 4 || v14 == 6))
              v41 = v40 + v40;
            if (v14 == self->_lastTwoHandReactionType)
            {
              if ((self->_lastTwoHandReactionEndTime.flags & 1) != 0)
              {
                *(_OWORD *)time = *(_OWORD *)&self->_lastTwoHandReactionEndTime.value;
                *(_QWORD *)&time[16] = self->_lastTwoHandReactionEndTime.epoch;
                v73 = *a6;
                v42 = GetDurationMilliseconds((CMTime *)time, (CMTime *)&v73);
              }
              else
              {
                v42 = 2000.0;
              }
              v41 = v41 + fmaxf(2000.0 - v42, 0.0);
            }
          }
          v43 = v41 + 400.0;
          if (v14 != 1)
            v43 = v41;
          if (DurationMilliseconds <= v43)
            goto LABEL_47;
          -[PTPersonReactionSlot setActiveGestureType:](v10, "setActiveGestureType:", -[PTPersonReactionSlot latestGestureType](v10, "latestGestureType"));
          -[PTPersonReactionSlot latestGestureFirstSeenTime](v10, "latestGestureFirstSeenTime");
          v69 = v71;
          v70 = v72;
          -[PTPersonReactionSlot setActiveGestureLastSeenTime:](v10, "setActiveGestureLastSeenTime:", &v69);
          v44 = -[PTPersonReactionSlot activeGestureType](v10, "activeGestureType") - 1;
          if (v12)
          {
            if (v44 > 5 || ((0x2Fu >> v44) & 1) == 0)
              goto LABEL_47;
            -[PTPersonWithReactions createReactionWithType:](self, "createReactionWithType:", qword_1C9322D70[v44]);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTPersonReactionSlot setReaction:](v10, "setReaction:", v45);

            objc_msgSend(v12, "boundingBox");
            v63 = CGRectGetMidX(v84);
            objc_msgSend(v12, "boundingBox");
            v46 = CGRectGetMidY(v85);
            v47.f64[0] = v63;
            v47.f64[1] = v46;
            v48 = COERCE_DOUBLE(vmul_f32(vadd_f32(v18, vcvt_f32_f64(v47)), (float32x2_t)0x3F0000003F000000));
            -[PTPersonReactionSlot reaction](v10, "reaction");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setPosition:", v48);

            -[PTPersonReactionSlot setReaction:](self->_leftHandSlot, "setReaction:", 0);
            -[PTPersonReactionSlot setReaction:](self->_rightHandSlot, "setReaction:", 0);
            _PTLogSystem();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
LABEL_61:
              -[PTPersonReactionSlot reaction](v10, "reaction");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "emoji");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = -[NSNumber intValue](self->_identifier, "intValue");
              *(_OWORD *)time = *(_OWORD *)&a6->var0;
              *(_QWORD *)&time[16] = a6->var3;
              Seconds = CMTimeGetSeconds((CMTime *)time);
              *(_DWORD *)time = 138412802;
              *(_QWORD *)&time[4] = v58;
              *(_WORD *)&time[12] = 1024;
              *(_DWORD *)&time[14] = v59;
              *(_WORD *)&time[18] = 2048;
              *(Float64 *)&time[20] = Seconds;
              _os_log_impl(&dword_1C9281000, v50, OS_LOG_TYPE_DEFAULT, "ReactionProvider: Created Reaction with (type: %@) (personID: %i) (time: %.2f)", time, 0x1Cu);

            }
          }
          else
          {
            if (v44 > 2)
              goto LABEL_47;
            v51 = qword_1C9322DA0[v44];
            -[PTPersonReactionSlot reaction](self->_bothHandsSlot, "reaction");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
              goto LABEL_47;
            -[PTPersonWithReactions createReactionWithType:](self, "createReactionWithType:", v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTPersonReactionSlot setReaction:](v10, "setReaction:", v53);

            -[PTPersonReactionSlot reaction](v10, "reaction");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setPosition:", *(double *)&v18);

            v55 = objc_msgSend(v11, "handChirality") != 1;
            -[PTPersonReactionSlot reaction](v10, "reaction");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setOrientation:", v55);

            _PTLogSystem();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              goto LABEL_61;
          }

          goto LABEL_47;
        }
      }
      else
      {
        v75 = 0;
        v76 = 0;
        v77 = 0;
      }
    }
    v67 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[PTPersonReactionSlot setLatestGestureFirstSeenTime:](v10, "setLatestGestureFirstSeenTime:", &v67);
    goto LABEL_47;
  }
  if (v12)
  {
    if (CanTriggerTwoHandReaction(v11, v12, 0.5))
      v19 = v13;
    else
      v19 = 0;
    -[PTPersonReactionSlot setLatestGestureType:](v10, "setLatestGestureType:", v19);
    if (v15 == (_DWORD)v19)
    {
      objc_msgSend(v12, "boundingBox");
      v62 = CGRectGetMidX(v82);
      objc_msgSend(v12, "boundingBox");
      v20 = CGRectGetMidY(v83);
      v21.f64[0] = v62;
      v21.f64[1] = v20;
      v18 = vmul_f32(vadd_f32(v18, vcvt_f32_f64(v21)), (float32x2_t)0x3F0000003F000000);
LABEL_17:
      -[PTPersonReactionSlot reaction](v10, "reaction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setPosition:", *(double *)&v18);

      v65 = *(_OWORD *)&a6->var0;
      v66 = a6->var3;
      -[PTPersonReactionSlot setActiveGestureLastSeenTime:](v10, "setActiveGestureLastSeenTime:", &v65);
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(v11, "confidence");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;

    if (v24 >= 0.5)
    {
      -[PTPersonReactionSlot setLatestGestureType:](v10, "setLatestGestureType:", v13);
      if (v15 == (_DWORD)v13)
        goto LABEL_17;
    }
    else
    {
      -[PTPersonReactionSlot setLatestGestureType:](v10, "setLatestGestureType:", 0);
    }
  }
  if (v10)
    -[PTPersonReactionSlot activeGestureLastSeenTime](v10, "activeGestureLastSeenTime");
  else
    memset(&v64, 0, sizeof(v64));
  *(_OWORD *)time = *(_OWORD *)&a6->var0;
  *(_QWORD *)&time[16] = a6->var3;
  v27 = GetDurationMilliseconds(&v64, (CMTime *)time);
  -[PTPersonReactionSlot milliSecondsToStop](v10, "milliSecondsToStop");
  if (v27 > v28)
  {
    -[PTPersonReactionSlot reaction](v10, "reaction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      _PTLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[PTPersonReactionSlot reaction](v10, "reaction");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "emoji");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[NSNumber intValue](self->_identifier, "intValue");
        *(_OWORD *)time = *(_OWORD *)&a6->var0;
        *(_QWORD *)&time[16] = a6->var3;
        v34 = CMTimeGetSeconds((CMTime *)time);
        *(_DWORD *)time = 138412802;
        *(_QWORD *)&time[4] = v32;
        *(_WORD *)&time[12] = 1024;
        *(_DWORD *)&time[14] = v33;
        *(_WORD *)&time[18] = 2048;
        *(Float64 *)&time[20] = v34;
        _os_log_impl(&dword_1C9281000, v30, OS_LOG_TYPE_DEFAULT, "ReactionProvider: Ended Reaction with (type: %@) (personID: %i) (time: %.2f)", time, 0x1Cu);

      }
      -[PTPersonReactionSlot setReaction:](v10, "setReaction:", 0);
    }
    -[PTPersonWithReactions _stopActiveGestureOnSlot:](self, "_stopActiveGestureOnSlot:", v10);
    if (self->_bothHandsSlot == v10)
    {
      v35 = *(_OWORD *)&a6->var0;
      self->_lastTwoHandReactionEndTime.epoch = a6->var3;
      *(_OWORD *)&self->_lastTwoHandReactionEndTime.value = v35;
      self->_lastTwoHandReactionType = -[PTPersonReactionSlot activeGestureType](self->_leftHandSlot, "activeGestureType");
      -[PTPersonWithReactions _stopActiveGestureOnSlot:](self, "_stopActiveGestureOnSlot:", self->_leftHandSlot);
      -[PTPersonWithReactions _stopActiveGestureOnSlot:](self, "_stopActiveGestureOnSlot:", self->_rightHandSlot);
    }
  }
LABEL_47:

}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (int)numFramesInactive
{
  return self->_numFramesInactive;
}

- (void)setNumFramesInactive:(int)a3
{
  self->_numFramesInactive = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTwoHandReactionEndTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastTwoHandReactionEndTime, 24, 1, 0);
  return result;
}

- (void)setLastTwoHandReactionEndTime:(id *)a3
{
  objc_copyStruct(&self->_lastTwoHandReactionEndTime, a3, 24, 1, 0);
}

- (unsigned)lastTwoHandReactionType
{
  return self->_lastTwoHandReactionType;
}

- (void)setLastTwoHandReactionType:(unsigned int)a3
{
  self->_lastTwoHandReactionType = a3;
}

- (unint64_t)reactionTriggerID
{
  return self->_reactionTriggerID;
}

- (void)setReactionTriggerID:(unint64_t *)a3
{
  self->_reactionTriggerID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownGesture, 0);
  objc_storeStrong((id *)&self->_bothHandsSlot, 0);
  objc_storeStrong((id *)&self->_rightHandSlot, 0);
  objc_storeStrong((id *)&self->_leftHandSlot, 0);
}

- (void)updateWithLeftHand:(NSObject *)a1 rightHand:(uint64_t)a2 timeStamp:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a1, a3, "At least one hand must be non-nil!", v3);
}

@end
