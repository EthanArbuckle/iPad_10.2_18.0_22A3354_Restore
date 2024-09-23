@implementation ACTUserMentalCursor

- (ACTUserMentalCursor)init
{
  return -[ACTUserMentalCursor initWithInternalSegments:externalSegments:](self, "initWithInternalSegments:externalSegments:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
}

- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4
{
  return -[ACTUserMentalCursor initWithInternalSegments:externalSegments:segmentCursor:position:](self, "initWithInternalSegments:externalSegments:segmentCursor:position:", a3, a4, 0, 0);
}

- (ACTUserMentalCursor)initWithInternalSegments:(id)a3 externalSegments:(id)a4 segmentCursor:(unint64_t)a5 position:(unint64_t)a6
{
  id v10;
  id v11;
  ACTUserMentalCursor *v12;
  uint64_t v13;
  NSString *intendedText;
  uint64_t v15;
  NSArray *externalSegments;
  uint64_t v17;
  NSArray *internalSegments;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ACTUserMentalCursor;
  v12 = -[ACTUserMentalCursor init](&v20, sel_init);
  if (v12)
  {
    objc_msgSend(v11, "componentsJoinedByString:", &stru_24FD49B78);
    v13 = objc_claimAutoreleasedReturnValue();
    intendedText = v12->_intendedText;
    v12->_intendedText = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    externalSegments = v12->_externalSegments;
    v12->_externalSegments = (NSArray *)v15;

    v17 = objc_msgSend(v10, "copy");
    internalSegments = v12->_internalSegments;
    v12->_internalSegments = (NSArray *)v17;

    v12->_segmentCursor = a5;
    v12->_positionInCurrentInternalSegment = a6;
  }

  return v12;
}

- (NSString)currentExternalSegment
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  -[ACTUserMentalCursor externalSegments](self, "externalSegments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    v7 = 0;
  }
  else
  {
    -[ACTUserMentalCursor externalSegments](self, "externalSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (NSString)currentInternalSegment
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  -[ACTUserMentalCursor internalSegments](self, "internalSegments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    v7 = 0;
  }
  else
  {
    -[ACTUserMentalCursor internalSegments](self, "internalSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (BOOL)advanceSegmentCursor
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  -[ACTUserMentalCursor externalSegments](self, "externalSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");

  if (v4 == v5)
    return 0;
  -[ACTUserMentalCursor setSegmentCursor:](self, "setSegmentCursor:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor") + 1);
  -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", 0);
  v7 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  -[ACTUserMentalCursor externalSegments](self, "externalSegments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 < objc_msgSend(v8, "count");

  return v6;
}

- (BOOL)rewindSegmentCursor
{
  unint64_t v3;

  v3 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  if (v3)
  {
    -[ACTUserMentalCursor setSegmentCursor:](self, "setSegmentCursor:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor") - 1);
    -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", 0);
    LOBYTE(v3) = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor") != 0;
  }
  return v3;
}

- (void)advancePositionByString:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = v13;
  if (objc_msgSend(v13, "length"))
  {
    v4 = v13;
    do
    {
      v5 = objc_msgSend(v4, "length");
      -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");
      v8 = v7 - -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");

      -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
      if (v5 >= v8)
      {
        objc_msgSend(v9, "substringFromIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v11, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[ACTUserMentalCursor advanceSegmentCursor](self, "advanceSegmentCursor");
      }
      else
      {
        objc_msgSend(v9, "substringWithRange:", v10, objc_msgSend(v4, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment")+ objc_msgSend(v4, "length"));
        objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v11, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v4 = v12;

    }
    while (objc_msgSend(v12, "length"));
  }

}

- (void)rewindPositionByString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = v12;
  if (objc_msgSend(v12, "length"))
  {
    v5 = v12;
    do
    {
      if (!-[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"))
      {
        -[ACTUserMentalCursor setSegmentCursor:](self, "setSegmentCursor:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor") - 1);
        -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", objc_msgSend(v6, "length"));

      }
      v7 = objc_msgSend(v5, "length");
      v8 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
      -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
      if (v7 <= v8)
        objc_msgSend(v9, "substringWithRange:", v10 - objc_msgSend(v5, "length"), objc_msgSend(v5, "length"));
      else
        objc_msgSend(v9, "substringToIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v11, "length"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACTUserMentalCursor setPositionInCurrentInternalSegment:](self, "setPositionInCurrentInternalSegment:", -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment")- objc_msgSend(v11, "length"));
      v5 = v4;
    }
    while (objc_msgSend(v4, "length"));
  }

}

- (_NSRange)rangeOfInputSegmentsForCandidate:(id)a3
{
  id v4;
  unint64_t i;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  _NSRange result;

  v4 = a3;
  for (i = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"); ; ++i)
  {
    -[ACTUserMentalCursor externalSegments](self, "externalSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (i > v7)
    {
      v9 = 0;
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_19;
    }
    v8 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
    v9 = i - -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
    -[ACTUserMentalCursor externalSegments](self, "externalSegments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_24FD49B78);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      objc_msgSend(v4, "candidate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v12);

      if ((v26 & 1) != 0)
        goto LABEL_18;
      goto LABEL_15;
    }
    if (!objc_msgSend(v12, "length"))
      break;
    objc_msgSend(v4, "candidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasSuffix:", v12);

    if (v16)
      break;
    v27 = objc_msgSend(v12, "length");
    objc_msgSend(v4, "candidate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v27 >= v29)
    {
      v9 = 0;
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
LABEL_15:

  }
  v17 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  if (v17 == -1)
    goto LABEL_15;
  v9 = i - v17;
  while (1)
  {
    v8 = v17;
    -[ACTUserMentalCursor externalSegments](self, "externalSegments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subarrayWithRange:", v8, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "componentsJoinedByString:", &stru_24FD49B78);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "candidate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v21, "isEqualToString:", v20);

    if ((v19 & 1) != 0)
      break;
    v22 = objc_msgSend(v20, "length");
    objc_msgSend(v4, "candidate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v22 < v24)
    {
      v17 = v8 - 1;
      ++v9;
      if (v8)
        continue;
    }
    goto LABEL_15;
  }

LABEL_18:
LABEL_19:

  v30 = v8;
  v31 = v9;
  result.length = v31;
  result.location = v30;
  return result;
}

- (void)enumerateRemainingLongCharactersForCurrentSegment:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v9 = 0;
  v5 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
  while (1)
  {
    -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v5 >= v7)
      break;
    -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v4[2](v4, v8, &v9);
      if (v9)
      {

        break;
      }
    }
    v5 += objc_msgSend(v8, "length");

  }
}

- (BOOL)atEndOfText
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v3 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  -[ACTUserMentalCursor internalSegments](self, "internalSegments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
  {
    v9 = 1;
  }
  else
  {
    v5 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor") + 1;
    -[ACTUserMentalCursor internalSegments](self, "internalSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == objc_msgSend(v6, "count"))
    {
      v7 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
      -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 >= objc_msgSend(v8, "length");

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)atBeginningOfText
{
  return !-[ACTUserMentalCursor segmentCursor](self, "segmentCursor")
      && -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment") == 0;
}

- (BOOL)nextLongCharacterEndsSegment
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  -[ACTUserMentalCursor currentLongCharacter](self, "currentLongCharacter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
  v5 = objc_msgSend(v3, "length") + v4;
  -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 >= objc_msgSend(v6, "length");

  return v5;
}

- (NSString)currentLongCharacter
{
  void *v3;

  if (-[ACTUserMentalCursor atEndOfText](self, "atEndOfText"))
  {
    v3 = 0;
  }
  else
  {
    -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", -[ACTUserMentalCursor segmentCursor](self, "segmentCursor"), -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)nextLongCharacter
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  -[ACTUserMentalCursor currentLongCharacter](self, "currentLongCharacter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  v4 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  v5 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
  v6 = objc_msgSend(v3, "length") + v5;
  -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6 >= v8)
    ++v4;
  -[ACTUserMentalCursor internalSegments](self, "internalSegments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v4 < v10)
  {
    if (v6 < v8)
      v11 = v6;
    else
      v11 = 0;
    -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", v4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return (NSString *)v12;
}

- (NSString)previousLongCharacter
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  v4 = -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment");
  if (v4)
  {
    -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", v3, v4 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    -[ACTUserMentalCursor internalSegments](self, "internalSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3 - 1;
    objc_msgSend(v6, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACTUserMentalCursor longCharacterAtSegment:position:](self, "longCharacterAtSegment:position:", v7, objc_msgSend(v8, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)longCharacterAtSegment:(unint64_t)a3 position:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  -[ACTUserMentalCursor internalSegments](self, "internalSegments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "_rangeOfLongCharacterAtIndex:", a4);
  if (v8 == a4)
  {
    objc_msgSend(v7, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)currentComposedCharacter
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"));
  v6 = v5;

  if (v4 == -[ACTUserMentalCursor positionInCurrentInternalSegment](self, "positionInCurrentInternalSegment"))
  {
    -[ACTUserMentalCursor currentInternalSegment](self, "currentInternalSegment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (unint64_t)segmentCursor
{
  return self->_segmentCursor;
}

- (void)setSegmentCursor:(unint64_t)a3
{
  self->_segmentCursor = a3;
}

- (unint64_t)positionInCurrentInternalSegment
{
  return self->_positionInCurrentInternalSegment;
}

- (void)setPositionInCurrentInternalSegment:(unint64_t)a3
{
  self->_positionInCurrentInternalSegment = a3;
}

- (NSArray)externalSegments
{
  return self->_externalSegments;
}

- (NSArray)internalSegments
{
  return self->_internalSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSegments, 0);
  objc_storeStrong((id *)&self->_externalSegments, 0);
  objc_storeStrong((id *)&self->_intendedText, 0);
}

@end
