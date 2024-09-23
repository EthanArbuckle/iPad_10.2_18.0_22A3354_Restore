@implementation PGFeatureExtractorAudioClassification

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AudioClassification");
  return CFSTR("AudioClassification");
}

- (id)featureNames
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AudioNone");
  v3[1] = CFSTR("Applause");
  v3[2] = CFSTR("Babble");
  v3[3] = CFSTR("Cheering");
  v3[4] = CFSTR("Laughter");
  v3[5] = CFSTR("Speech");
  v3[6] = CFSTR("Music");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 7;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a3, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioClassification");
  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorAudioClassification featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v6)
  {
    v10 = 0;
LABEL_16:
    LODWORD(v8) = 1.0;
    objc_msgSend(v9, "setFloat:atIndex:", v10, v8);
    goto LABEL_17;
  }
  if ((v6 & 1) != 0)
  {
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", 1, v8);
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "setFloat:atIndex:", 2, v8);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "setFloat:atIndex:", 3, v8);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "setFloat:atIndex:", 4, v8);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_14:
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "setFloat:atIndex:", 5, v8);
  if ((v6 & 0x20) != 0)
  {
LABEL_15:
    v10 = 6;
    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

@end
