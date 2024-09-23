@implementation PGMemoryContext

- (PGMemoryContext)initWithLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMemoryContext *v12;
  PGMemoryContext *v13;
  NSTimeZone *v14;
  NSTimeZone *timeZone;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PGMemoryContext;
  v12 = -[PGMemoryContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDate, a3);
    if (v10)
    {
      v14 = (NSTimeZone *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
      v14 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
    timeZone = v13->_timeZone;
    v13->_timeZone = v14;

    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    v13->_futureLookup = 0;
    -[PGMemoryContext initDeniedCategoriesWithPhotoLibrary:](v13, "initDeniedCategoriesWithPhotoLibrary:", v11);
  }

  return v13;
}

- (void)initDeniedCategoriesWithPhotoLibrary:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *categoriesDeniedForFallback;
  NSIndexSet *v6;
  NSIndexSet *categoriesDeniedForContextual;
  NSIndexSet *v8;

  v4 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[NSIndexSet addIndex:](v4, "addIndex:", 8);
  -[NSIndexSet addIndex:](v4, "addIndex:", 23);
  -[NSIndexSet addIndex:](v4, "addIndex:", 31);
  categoriesDeniedForFallback = self->_categoriesDeniedForFallback;
  self->_categoriesDeniedForFallback = v4;
  v8 = v4;

  v6 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[NSIndexSet addIndex:](v6, "addIndex:", 31);
  categoriesDeniedForContextual = self->_categoriesDeniedForContextual;
  self->_categoriesDeniedForContextual = v6;

}

- (PGMemoryContext)initWithMemoryPlanner:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PGMemoryContext *v11;
  uint64_t v12;
  NSDate *creationDateOfLastMemory;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGMemoryContext initWithLocalDate:timeZone:photoLibrary:](self, "initWithLocalDate:timeZone:photoLibrary:", v9, v10, v7);

  if (v11)
  {
    objc_msgSend(v6, "creationDateOfLastMemory");
    v12 = objc_claimAutoreleasedReturnValue();
    creationDateOfLastMemory = v11->_creationDateOfLastMemory;
    v11->_creationDateOfLastMemory = (NSDate *)v12;

    v11->_numberOfDaysSinceMemoryUpgrade = objc_msgSend(v6, "numberOfDaysSinceMemoryUpgrade");
  }

  return v11;
}

- (PGMemoryContext)initWithFutureLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5
{
  PGMemoryContext *result;

  result = -[PGMemoryContext initWithLocalDate:timeZone:photoLibrary:](self, "initWithLocalDate:timeZone:photoLibrary:", a3, a4, a5);
  if (result)
    result->_futureLookup = 1;
  return result;
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)creationDateOfLastMemory
{
  return self->_creationDateOfLastMemory;
}

- (void)setCreationDateOfLastMemory:(id)a3
{
  objc_storeStrong((id *)&self->_creationDateOfLastMemory, a3);
}

- (unint64_t)numberOfDaysSinceMemoryUpgrade
{
  return self->_numberOfDaysSinceMemoryUpgrade;
}

- (void)setNumberOfDaysSinceMemoryUpgrade:(unint64_t)a3
{
  self->_numberOfDaysSinceMemoryUpgrade = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)futureLookup
{
  return self->_futureLookup;
}

- (NSIndexSet)categoriesDeniedForContextual
{
  return self->_categoriesDeniedForContextual;
}

- (NSIndexSet)categoriesDeniedForFallback
{
  return self->_categoriesDeniedForFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesDeniedForFallback, 0);
  objc_storeStrong((id *)&self->_categoriesDeniedForContextual, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_creationDateOfLastMemory, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
}

@end
