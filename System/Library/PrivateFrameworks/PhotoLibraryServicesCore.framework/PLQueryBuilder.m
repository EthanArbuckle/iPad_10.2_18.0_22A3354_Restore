@implementation PLQueryBuilder

- (PLQueryBuilder)initWithConjunction:(int)a3
{
  uint64_t v3;
  PLQueryBuilder *v4;
  PLQuery *v5;
  PLQuery *query;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)PLQueryBuilder;
  v4 = -[PLQueryBuilder init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(PLQuery);
    query = v4->_query;
    v4->_query = v5;

    -[PLQuery setConjunction:](v4->_query, "setConjunction:", v3);
  }
  return v4;
}

- (void)_addQueryWithKey:(int)a3 firstValue:(id)a4 secondValue:(id)a5 valueType:(int)a6 unit:(int)a7 comparator:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  id v14;
  PLSingleQuery *v15;
  id v16;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a3;
  v16 = a5;
  v14 = a4;
  v15 = objc_alloc_init(PLSingleQuery);
  -[PLSingleQuery setKey:](v15, "setKey:", v12);
  -[PLSingleQuery setValueType:](v15, "setValueType:", v10);
  -[PLSingleQuery setFirstValue:](v15, "setFirstValue:", v14);

  if (v16)
    -[PLSingleQuery setSecondValue:](v15, "setSecondValue:", v16);
  if ((_DWORD)v8)
    -[PLSingleQuery setComparator:](v15, "setComparator:", v8);
  if ((_DWORD)v9)
    -[PLSingleQuery setUnit:](v15, "setUnit:", v9);
  -[PLQuery addSingleQueries:](self->_query, "addSingleQueries:", v15);

}

- (void)addIsFavoriteQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 1, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addIsHiddenQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 2, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addIsAdjustedQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 3, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addIsRawQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 4, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addIsProResQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 9, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addAssetTypeQuery:(int)a3 exclude:(BOOL)a4
{
  uint64_t v5;
  id v6;

  if (a4)
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 5, v6, 1, v5);

}

- (void)addIsInAlbumQuery:(id)a3
{
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 100, a3, 3, 22);
}

- (void)addIsInAnyAlbumQuery
{
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 100, 0, 3, 23);
}

- (void)addIsReferencedMediaQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 6, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (BOOL)_isValidDateKey:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 200;
}

- (void)addIsDateQueryKey:(int)a3 withDate:(id)a4 exclude:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v8;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v9 = a4;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:", v6))
  {
    if (v5)
      v8 = 2;
    else
      v8 = 1;
    -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", v6, v9, 4, v8);
  }

}

- (void)addIsAfterDateQueryKey:(int)a3 withDate:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:", v4))
    -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", v4, v6, 4, 5);

}

- (void)addIsBeforeDateQueryKey:(int)a3 withDate:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:", v4))
    -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", v4, v6, 4, 4);

}

- (void)addInTheLastDaysQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v9;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addDateUnitQueryForKey:withValue:withType:withUnit:exclude:](self, "_addDateUnitQueryForKey:withValue:withType:withUnit:exclude:", v7, v9, 1, 1, v5);

  }
}

- (void)addInTheLastWeeksQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v9;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addDateUnitQueryForKey:withValue:withType:withUnit:exclude:](self, "_addDateUnitQueryForKey:withValue:withType:withUnit:exclude:", v7, v9, 1, 2, v5);

  }
}

- (void)addInTheLastMonthsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v9;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addDateUnitQueryForKey:withValue:withType:withUnit:exclude:](self, "_addDateUnitQueryForKey:withValue:withType:withUnit:exclude:", v7, v9, 1, 3, v5);

  }
}

- (void)addInTheLastYearsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v9;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addDateUnitQueryForKey:withValue:withType:withUnit:exclude:](self, "_addDateUnitQueryForKey:withValue:withType:withUnit:exclude:", v7, v9, 1, 4, v5);

  }
}

- (void)addInTheLastSecondsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v9;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addDateUnitQueryForKey:withValue:withType:withUnit:exclude:](self, "_addDateUnitQueryForKey:withValue:withType:withUnit:exclude:", v7, v9, 1, 5, v5);

  }
}

- (void)_addDateUnitQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withUnit:(int)a6 exclude:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  v14 = a4;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:", v10))
  {
    convertToData(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v13 = 41;
    else
      v13 = 40;
    -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v10, v12, 0, v9, v8, v13);

  }
}

- (void)_addRangeQueryForKey:(int)a3 withFirstValue:(id)a4 withSecondValue:(id)a5 withType:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  convertToData(a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  convertToData(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v8, v12, v11, v6, 0, 30);
}

- (void)addApertureRangeQueryBetweenValue:(double)a3 andValue:(double)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLQueryBuilder _addRangeQueryForKey:withFirstValue:withSecondValue:withType:](self, "_addRangeQueryForKey:withFirstValue:withSecondValue:withType:", 300, v7, v6, 2);

}

- (void)addIsoRangeQueryBetweenValue:(int64_t)a3 andValue:(int64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLQueryBuilder _addRangeQueryForKey:withFirstValue:withSecondValue:withType:](self, "_addRangeQueryForKey:withFirstValue:withSecondValue:withType:", 304, v7, v6, 1);

}

- (void)addDateRangeQueryKey:(int)a3 between:(id)a4 and:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  v8 = a5;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:", v6))
    -[PLQueryBuilder _addRangeQueryForKey:withFirstValue:withSecondValue:withType:](self, "_addRangeQueryForKey:withFirstValue:withSecondValue:withType:", v6, v9, v8, 4);

}

- (BOOL)_isValidStringComparator:(int)a3
{
  return (a3 < 0x34) & (0xC000003F00000uLL >> a3);
}

- (void)addFilenameQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 400, a3, *(_QWORD *)&a4);
}

- (void)addTitleQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 401, a3, *(_QWORD *)&a4);
}

- (void)addDescriptionQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 403, a3, *(_QWORD *)&a4);
}

- (void)addTextQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 402, a3, *(_QWORD *)&a4);
}

- (void)_addStringQueryKey:(int)a3 stringValue:(id)a4 comparator:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v9 = a4;
  if (-[PLQueryBuilder _isValidStringComparator:](self, "_isValidStringComparator:", v5))
  {
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v6, v8, 0, 3, 0, v5);

  }
}

- (BOOL)_isValidCircularRegionComparator:(int)a3
{
  return (a3 - 31) < 2;
}

- (void)_addCircularRegionQueryKey:(int)a3 circularRegionValue:(id)a4 comparator:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (-[PLQueryBuilder _isValidCircularRegionComparator:](self, "_isValidCircularRegionComparator:", v5))
    -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", v6, v8, 5, v5);

}

- (BOOL)_validIsEmptyQueryKey:(int)a3
{
  return a3 == 6 || a3 == 403 || a3 == 401;
}

- (void)addIsEmptyQueryForKey:(int)a3 isEmpty:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _validIsEmptyQueryKey:](self, "_validIsEmptyQueryKey:"))
  {
    if (v4)
      v7 = 50;
    else
      v7 = 51;
    -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v5, 0, 0, 0, 0, v7);
  }
}

- (BOOL)_isValidNumericComparator:(int)a3
{
  return (a3 - 1) < 6;
}

- (void)addApertureQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 300, *(_QWORD *)&a4, a3);
}

- (void)addBitrateQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 309, *(_QWORD *)&a4, a3);
}

- (void)addCameraModelQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 301, a3, *(_QWORD *)&a4);
}

- (void)addCameraMakeQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 310, a3, *(_QWORD *)&a4);
}

- (void)addCodecQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 311, a3, *(_QWORD *)&a4);
}

- (void)addDurationQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 312, *(_QWORD *)&a4, a3);
}

- (void)addExposureBiasQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 313, *(_QWORD *)&a4, a3);
}

- (void)addFlashQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 302, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addFocalLengthQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 303, *(_QWORD *)&a4, a3);
}

- (void)addIsoQuery:(int64_t)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 304, a3, *(_QWORD *)&a4);
}

- (void)addFpsQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 314, (uint64_t)a3, *(_QWORD *)&a4);
}

- (void)addLensModelQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 305, a3, *(_QWORD *)&a4);
}

- (void)addMeteringModeQuery:(int64_t)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 315, a3, *(_QWORD *)&a4);
}

- (void)addSampleRateQuery:(int64_t)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 316, a3, *(_QWORD *)&a4);
}

- (void)addShutterSpeedQuery:(double)a3 comparator:(int)a4
{
  -[PLQueryBuilder addDoubleQueryKey:withValue:comparator:](self, "addDoubleQueryKey:withValue:comparator:", 306, *(_QWORD *)&a4, a3);
}

- (void)addTrackFormatQuery:(int64_t)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 317, a3, *(_QWORD *)&a4);
}

- (void)addWhiteBalanceQuery:(int64_t)a3 comparator:(int)a4
{
  -[PLQueryBuilder addIntegerQueryKey:withValue:comparator:](self, "addIntegerQueryKey:withValue:comparator:", 318, a3, *(_QWORD *)&a4);
}

- (void)addHasLocationQuery:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 319, MEMORY[0x1E0C9AAB0], 1, v3);
}

- (void)addDoubleQueryKey:(int)a3 withValue:(double)a4 comparator:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidNumericComparator:](self, "_isValidNumericComparator:", *(_QWORD *)&a5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    convertToData(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v7, v10, 0, 2, 0, v5);
  }
}

- (void)addIntegerQueryKey:(int)a3 withValue:(int64_t)a4 comparator:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (-[PLQueryBuilder _isValidNumericComparator:](self, "_isValidNumericComparator:", *(_QWORD *)&a5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    convertToData(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v7, v10, 0, 1, 0, v5);
  }
}

- (void)addKeywordQuery:(id)a3 exclude:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 23;
  else
    v4 = 22;
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 500, a3, v4);
}

- (void)addPersonQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 550, a3, *(_QWORD *)&a4);
}

- (void)addPersonUUIDQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 551, a3, *(_QWORD *)&a4);
}

- (void)addPersonUUIDInMomentQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addStringQueryKey:stringValue:comparator:](self, "_addStringQueryKey:stringValue:comparator:", 553, a3, *(_QWORD *)&a4);
}

- (void)addCircularRegionQuery:(id)a3 comparator:(int)a4
{
  -[PLQueryBuilder _addCircularRegionQueryKey:circularRegionValue:comparator:](self, "_addCircularRegionQueryKey:circularRegionValue:comparator:", 600, a3, *(_QWORD *)&a4);
}

- (void)addUnableToUploadQuery
{
  -[PLQueryBuilder _addQueryForKey:withValue:withType:withComparator:](self, "_addQueryForKey:withValue:withType:withComparator:", 1000, MEMORY[0x1E0C9AAB0], 1, 1);
}

- (void)_addQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withComparator:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  if (a4)
  {
    convertToData(a4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = (id)v10;
  -[PLQueryBuilder _addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:](self, "_addQueryWithKey:firstValue:secondValue:valueType:unit:comparator:", v8, v10, 0, v7, 0, v6);

}

- (id)query
{
  return self->_query;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

+ (id)andCombineFirstQuery:(id)a3 secondQuery:(id)a4
{
  return +[PLQueryBuilder _combineFirstQuery:secondQuery:conjunction:](PLQueryBuilder, "_combineFirstQuery:secondQuery:conjunction:", a3, a4, 1);
}

+ (id)orCombineFirstQuery:(id)a3 secondQuery:(id)a4
{
  return +[PLQueryBuilder _combineFirstQuery:secondQuery:conjunction:](PLQueryBuilder, "_combineFirstQuery:secondQuery:conjunction:", a3, a4, 0);
}

+ (id)notQuery:(id)a3
{
  id v3;
  PLQuery *v4;

  v3 = a3;
  v4 = objc_alloc_init(PLQuery);
  -[PLQuery setConjunction:](v4, "setConjunction:", 2);
  -[PLQuery setFirst:](v4, "setFirst:", v3);

  return v4;
}

+ (id)_combineFirstQuery:(id)a3 secondQuery:(id)a4 conjunction:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  PLQuery *v9;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(PLQuery);
  -[PLQuery setFirst:](v9, "setFirst:", v8);

  -[PLQuery setSecond:](v9, "setSecond:", v7);
  -[PLQuery setConjunction:](v9, "setConjunction:", v5);
  return v9;
}

+ (id)validComparatorsForQueryKey:(int)a3
{
  id result;
  char v4;

  result = &unk_1E378FE88;
  if (a3 <= 299)
  {
    if (a3 <= 9 && ((1 << a3) & 0x27E) != 0)
      return result;
    if ((a3 - 200) < 2)
      return &unk_1E378FF18;
    if (a3 != 100)
      return (id)MEMORY[0x1E0C9AA60];
    return &unk_1E378FEA0;
  }
  if (a3 > 399)
  {
    if (a3 <= 549)
    {
      switch(a3)
      {
        case 400:
          return &unk_1E378FEB8;
        case 401:
        case 403:
          return &unk_1E378FED0;
        case 402:
          result = &unk_1E378FEE8;
          break;
        default:
          if (a3 == 500)
            return &unk_1E378FEA0;
          return (id)MEMORY[0x1E0C9AA60];
      }
      return result;
    }
    if (a3 <= 552)
    {
      if (a3 == 550)
        return &unk_1E378FEB8;
      if (a3 != 551)
        return (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      if (a3 == 1000)
        return result;
      if (a3 == 600)
        return &unk_1E378FF30;
      if (a3 != 553)
        return (id)MEMORY[0x1E0C9AA60];
    }
    return &unk_1E378FEA0;
  }
  v4 = a3 - 44;
  if ((a3 - 300) > 0x13)
    return (id)MEMORY[0x1E0C9AA60];
  if (((1 << v4) & 0x59) != 0)
    return &unk_1E378FF00;
  if (((1 << v4) & 0x22) != 0)
    return &unk_1E378FED0;
  if (a3 != 319)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

+ (id)validUnitValuesForQueryKey:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 0xC8)
    return &unk_1E378FF48;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

@end
