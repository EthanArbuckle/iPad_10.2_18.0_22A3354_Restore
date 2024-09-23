@implementation RTReviewedPlace

- (RTReviewedPlace)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMuid_lastSuggestedReviewDate_hasUserReviewed_modifiedDate_);
}

- (RTReviewedPlace)initWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4 hasUserReviewed:(BOOL)a5 modifiedDate:(id)a6
{
  id v10;
  id v11;
  RTReviewedPlace *v12;
  RTReviewedPlace *v13;
  uint64_t v14;
  NSDate *lastSuggestedReviewDate;
  uint64_t v16;
  NSDate *modifiedDate;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RTReviewedPlace;
  v12 = -[RTReviewedPlace init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_muid = a3;
    v14 = objc_msgSend(v10, "copy");
    lastSuggestedReviewDate = v13->_lastSuggestedReviewDate;
    v13->_lastSuggestedReviewDate = (NSDate *)v14;

    v13->_hasUserReviewed = a5;
    v16 = objc_msgSend(v11, "copy");
    modifiedDate = v13->_modifiedDate;
    v13->_modifiedDate = (NSDate *)v16;

  }
  return v13;
}

- (id)description
{
  void *v3;
  unint64_t muid;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  muid = self->_muid;
  -[NSDate stringFromDate](self->_lastSuggestedReviewDate, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasUserReviewed)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[NSDate stringFromDate](self->_modifiedDate, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("muid, %lu, lastSuggestedReviewDate, %@, hasUserReviewed, %@, stringFromDate, %@"), muid, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSDate)lastSuggestedReviewDate
{
  return self->_lastSuggestedReviewDate;
}

- (BOOL)hasUserReviewed
{
  return self->_hasUserReviewed;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_lastSuggestedReviewDate, 0);
}

@end
