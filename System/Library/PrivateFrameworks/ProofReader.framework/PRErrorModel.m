@implementation PRErrorModel

- (PRErrorModel)initWithCustomErrorModel:(id)a3
{
  PRErrorModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRErrorModel;
  v4 = -[PRErrorModel init](&v6, sel_init);
  if (v4)
    v4->_customErrorModel = (PRErrorModeling *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRErrorModel;
  -[PRErrorModel dealloc](&v3, sel_dealloc);
}

- (double)errorScoreForType:(unint64_t)a3
{
  double result;

  result = -5.0;
  if (a3 <= 0xD)
    return errorScoreForType__errorScores[a3];
  return result;
}

- (BOOL)hasCustomReplacementErrorScores
{
  PRErrorModeling *customErrorModel;

  customErrorModel = self->_customErrorModel;
  if (customErrorModel)
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  return customErrorModel & 1;
}

- (BOOL)hasCustomTranspositionErrorScores
{
  PRErrorModeling *customErrorModel;

  customErrorModel = self->_customErrorModel;
  if (customErrorModel)
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  return customErrorModel & 1;
}

- (BOOL)hasCustomInsertionErrorScores
{
  PRErrorModeling *customErrorModel;

  customErrorModel = self->_customErrorModel;
  if (customErrorModel)
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  return customErrorModel & 1;
}

- (BOOL)hasCustomOmissionErrorScores
{
  PRErrorModeling *customErrorModel;

  customErrorModel = self->_customErrorModel;
  if (customErrorModel)
    LOBYTE(customErrorModel) = objc_opt_respondsToSelector();
  return customErrorModel & 1;
}

- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  double v8;
  double result;
  unint64_t v10;

  v4 = a4;
  v5 = a3;
  -[PRErrorModel errorScoreForType:](self, "errorScoreForType:", 8);
  v8 = v7;
  if (-[PRErrorModel hasCustomReplacementErrorScores](self, "hasCustomReplacementErrorScores"))
  {
    -[PRErrorModeling replacementErrorScoreForIntendedCharacter:actualCharacter:](self->_customErrorModel, "replacementErrorScoreForIntendedCharacter:actualCharacter:", v5, v4);
    return result;
  }
  if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
  {
    if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      goto LABEL_6;
LABEL_12:
    if ((_DWORD)v5 == 159)
      LODWORD(v5) = 255;
    else
      LODWORD(v5) = v5 + 16;
    goto LABEL_15;
  }
  if ((v5 - 216) < 7)
  {
LABEL_6:
    LODWORD(v5) = v5 + 32;
    goto LABEL_15;
  }
  if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
    goto LABEL_12;
LABEL_15:
  if ((v4 - 65) < 0x1A || (v4 - 192) < 0x17)
  {
    if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
      goto LABEL_18;
  }
  else
  {
    if ((v4 - 216) < 7)
    {
LABEL_18:
      LODWORD(v4) = v4 + 32;
      goto LABEL_19;
    }
    if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
    {
LABEL_19:
      if ((v5 - 97) <= 0x19 && v4 >= 0x61 && v4 <= 0x7A)
      {
        v10 = replacementScores[26 * (v4 - 97) + (v5 - 97)];
        if (v10 >= 2)
          return v8 + log10((double)v10);
      }
    }
  }
  return v8;
}

- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  double v8;
  double result;
  unint64_t v10;

  v4 = a4;
  v5 = a3;
  -[PRErrorModel errorScoreForType:](self, "errorScoreForType:", 9);
  v8 = v7;
  if (-[PRErrorModel hasCustomTranspositionErrorScores](self, "hasCustomTranspositionErrorScores"))
  {
    -[PRErrorModeling transpositionErrorScoreForIntendedFirstCharacter:intendedSecondCharacter:](self->_customErrorModel, "transpositionErrorScoreForIntendedFirstCharacter:intendedSecondCharacter:", v5, v4);
    return result;
  }
  if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
  {
    if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      goto LABEL_6;
LABEL_12:
    if ((_DWORD)v5 == 159)
      LODWORD(v5) = 255;
    else
      LODWORD(v5) = v5 + 16;
    goto LABEL_15;
  }
  if ((v5 - 216) < 7)
  {
LABEL_6:
    LODWORD(v5) = v5 + 32;
    goto LABEL_15;
  }
  if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
    goto LABEL_12;
LABEL_15:
  if ((v4 - 65) < 0x1A || (v4 - 192) < 0x17)
  {
    if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
      goto LABEL_18;
  }
  else
  {
    if ((v4 - 216) < 7)
    {
LABEL_18:
      LODWORD(v4) = v4 + 32;
      goto LABEL_19;
    }
    if ((v4 - 138) > 0x15 || ((1 << (v4 + 118)) & 0x200015) == 0)
    {
LABEL_19:
      if ((v5 - 97) <= 0x19 && v4 >= 0x61 && v4 <= 0x7A)
      {
        v10 = transpositionScores[26 * (v4 - 97) + (v5 - 97)];
        if (v10 >= 2)
          return v8 + log10((double)v10);
      }
    }
  }
  return v8;
}

- (double)insertionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 insertedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  double result;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[PRErrorModel errorScoreForType:](self, "errorScoreForType:", 11);
  v10 = v9;
  if (!-[PRErrorModel hasCustomInsertionErrorScores](self, "hasCustomInsertionErrorScores"))
    return v10;
  -[PRErrorModeling insertionErrorScoreForIntendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:](self->_customErrorModel, "insertionErrorScoreForIntendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:", v7, v6, v5);
  return result;
}

- (double)omissionErrorScoreForIntendedPrecedingCharacter:(unsigned __int16)a3 omittedCharacter:(unsigned __int16)a4 intendedFollowingCharacter:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  double result;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[PRErrorModel errorScoreForType:](self, "errorScoreForType:", 10);
  v10 = v9;
  if (!-[PRErrorModel hasCustomOmissionErrorScores](self, "hasCustomOmissionErrorScores"))
    return v10;
  -[PRErrorModeling omissionErrorScoreForIntendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:](self->_customErrorModel, "omissionErrorScoreForIntendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", v7, v6, v5);
  return result;
}

@end
