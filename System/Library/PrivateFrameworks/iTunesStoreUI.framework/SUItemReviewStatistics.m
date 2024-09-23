@implementation SUItemReviewStatistics

- (SUItemReviewStatistics)initWithDictionary:(id)a3
{
  SUItemReviewStatistics *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t numberOfUserRatings;
  NSString *numberOfUserRatingsString;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUItemReviewStatistics;
  v4 = -[SUItemReviewStatistics init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("average-user-rating"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "floatValue");
      v4->_averageUserRating = v6;
    }
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("user-rating-count"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4->_numberOfUserRatings = (int)objc_msgSend(v7, "intValue");
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("user-rating-count-string"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "length"))
      v4->_numberOfUserRatingsString = (NSString *)v8;
    v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("user-review-count"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      numberOfUserRatings = (int)objc_msgSend(v9, "intValue");
    else
      numberOfUserRatings = v4->_numberOfUserRatings;
    v4->_numberOfUserReviews = numberOfUserRatings;
    numberOfUserRatingsString = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("user-review-count-string"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSString length](numberOfUserRatingsString, "length"))
      numberOfUserRatingsString = v4->_numberOfUserRatingsString;
    v4->_numberOfUserReviewsString = numberOfUserRatingsString;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemReviewStatistics;
  -[SUItemReviewStatistics dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)(v5 + 8) = self->_averageUserRating;
  *(_QWORD *)(v5 + 16) = self->_numberOfUserRatings;
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_numberOfUserRatingsString, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = self->_numberOfUserReviews;
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_numberOfUserReviewsString, "copyWithZone:", a3);
  return (id)v5;
}

- (float)averageUserRating
{
  return self->_averageUserRating;
}

- (void)setAverageUserRating:(float)a3
{
  self->_averageUserRating = a3;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  self->_numberOfUserRatings = a3;
}

- (NSString)numberOfUserRatingsString
{
  return self->_numberOfUserRatingsString;
}

- (void)setNumberOfUserRatingsString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)numberOfUserReviews
{
  return self->_numberOfUserReviews;
}

- (void)setNumberOfUserReviews:(int64_t)a3
{
  self->_numberOfUserReviews = a3;
}

- (NSString)numberOfUserReviewsString
{
  return self->_numberOfUserReviewsString;
}

- (void)setNumberOfUserReviewsString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
