@implementation TISKPathEvent

- (BOOL)isMissingATouch
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  -[TISKEvent tap](self, "tap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TISKEvent tap](self, "tap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDownUpTap");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)init:(id)a3 candidate:(id)a4 allTouches:(id)a5 emojiSearchMode:(BOOL)a6 order:(int64_t)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id *v16;
  id *v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TISKPathEvent;
  v16 = -[TISKEvent init:emojiSearchMode:order:](&v21, sel_init_emojiSearchMode_order_, 8, v8, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 6, a3);
    objc_storeStrong(v17 + 4, a4);
    objc_msgSend(v14, "candidate");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v17[5];
    v17[5] = (id)v18;

    objc_storeStrong(v17 + 7, a5);
    objc_msgSend(v17, "setHasTimestamp:", 1);
  }

  return v17;
}

- (double)countPathPauses:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  BOOL v45;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 4)
  {
    v5 = objc_msgSend(v3, "count") - 3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = 1;
      do
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", ++v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        objc_msgSend(v10, "location");
        v13 = v12;
        objc_msgSend(v11, "location");
        *(float *)&v13 = v13 - v14;
        objc_msgSend(v10, "location");
        v16 = v15;
        objc_msgSend(v11, "location");
        v18 = v17;

        v19 = v16 - v18;
        *(float *)&v20 = hypotf(*(float *)&v13, v19);
        objc_msgSend(v8, "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v21);

      }
      while (v7 <= v5);
    }
    v4 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  v22 = v3;
  if ((unint64_t)objc_msgSend(v22, "count") >= 4)
  {
    v24 = objc_msgSend(v22, "count") - 3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v26 = 1;
      do
      {
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v22, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", ++v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v28;
        objc_msgSend(v29, "timestamp");
        v32 = v31;
        objc_msgSend(v30, "timestamp");
        v34 = v33;

        objc_msgSend(v27, "numberWithDouble:", v32 - v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v35);

      }
      while (v26 <= v24);
    }
    v23 = (void *)objc_msgSend(v25, "copy");

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  v36 = 0.0;
  if (objc_msgSend(v4, "count") != 1)
  {
    v37 = 0;
    v38 = 0.0;
    v39 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v39 = v39 + v41;

      objc_msgSend(v23, "objectAtIndexedSubscript:", v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v38 = v38 + v43;

      if (v38 > 2.0 && v39 > 40.0)
        v36 = v36 + 1.0;
      if (v39 > 40.0)
      {
        v39 = 0.0;
        v38 = 0.0;
      }
      ++v37;
    }
    while (objc_msgSend(v4, "count") - 1 > v37);
    v45 = v39 < 40.0;
    if (v38 <= 2.0)
      v45 = 0;
    if (v45)
      v36 = v36 + 1.0;
  }

  return v36;
}

- (void)reportToSession:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  NSUInteger v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  if (-[TISKEvent isValidCandidate:](self, "isValidCandidate:", self->_candidate))
  {
    objc_msgSend(v17, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfWordsCounter);
    objc_msgSend(v17, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfPaths);
    -[TISKEvent touchUpTimestamp](self, "touchUpTimestamp");
    v5 = v4;
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v7 = v5 - v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSample:forKey:", v8, kTISKTotalPathTime);

    if (v7 > 0.0)
    {
      v9 = -[NSString length](self->_candidateString, "length");
      objc_msgSend(v17, "addToCounterForRateMetric:forKey:", v9, kTISKPathTypingSpeed);
      objc_msgSend(v17, "addToDurationForRateMetric:forKey:", kTISKPathTypingSpeed, v7);
      objc_msgSend(v17, "addToDurationForRateMetric:forKey:", kTISKTapTypingSpeed, -v7);
    }
    if (v7 > 2.0)
    {
      -[TISKPathEvent countPathPauses:](self, "countPathPauses:", self->_allTouches);
      if (v10 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSample:forKey:", v11, kTISKMidPathPause);

      }
    }
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKEvent tap](self, "tap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "totalTapDistance");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSample:forKey:", v14, kTISKTotalPathLength);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardCandidate excessPathRatio](self->_candidate, "excessPathRatio");
      if (v15 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSample:forKey:", v16, kTISKPathErrorDistanceMetric);

      }
    }
  }

}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)TISKPathEvent;
    -[TISKEvent reportInterKeyTiming:previousEvent:](&v19, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v9 = v8;
    objc_msgSend(v7, "touchDownTimestamp");
    v11 = v9 - v10;
    v12 = objc_msgSend(v7, "type");
    switch(v12)
    {
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = &kTISKSpaceToPathMetric;
        goto LABEL_8;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = &kTISKDeleteToPathMetric;
        goto LABEL_8;
      case 8:
        v13 = (void *)MEMORY[0x1E0CB37E8];
        -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
        v15 = v14;
        objc_msgSend(v7, "touchUpTimestamp");
        objc_msgSend(v13, "numberWithDouble:", v15 - v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = &kTISKPathToPathMetric;
LABEL_8:
        objc_msgSend(v6, "addSample:forKey:", v17, *v18);

        break;
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("path"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTouches, 0);
  objc_storeStrong((id *)&self->_pathTouchUp, 0);
  objc_storeStrong((id *)&self->_candidateString, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
