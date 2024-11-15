@implementation UGCReviewedPlace

- (UGCReviewedPlace)initWithMUID:(unint64_t)a3
{
  UGCReviewedPlace *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UGCReviewedPlace;
  result = -[UGCReviewedPlace init](&v5, "init");
  if (result)
  {
    result->_muid = a3;
    result->_originallySavedMUID = 0;
    result->_isDeleted = 0;
    result->_recommendState = 0;
    result->_numberOfPhotosAdded = 0;
    result->_version = 3;
  }
  return result;
}

- (UGCReviewedPlace)initWithMUID:(unint64_t)a3 originallySavedMUID:(unint64_t)a4
{
  UGCReviewedPlace *result;

  result = -[UGCReviewedPlace initWithMUID:](self, "initWithMUID:", a3);
  if (result)
    result->_originallySavedMUID = a4;
  return result;
}

- (BOOL)hasCachedValues
{
  return self->_recommendState || self->_numberOfPhotosAdded != 0;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (unint64_t)originallySavedMUID
{
  return self->_originallySavedMUID;
}

- (NSString)communityIdentifier
{
  return self->_communityIdentifier;
}

- (void)setCommunityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (int64_t)recommendState
{
  return self->_recommendState;
}

- (void)setRecommendState:(int64_t)a3
{
  self->_recommendState = a3;
}

- (unint64_t)numberOfPhotosAdded
{
  return self->_numberOfPhotosAdded;
}

- (void)setNumberOfPhotosAdded:(unint64_t)a3
{
  self->_numberOfPhotosAdded = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  self->_creationDate = (NSDate *)a3;
}

- (NSDate)dateOfLastEdit
{
  return self->_dateOfLastEdit;
}

- (void)setDateOfLastEdit:(id)a3
{
  self->_dateOfLastEdit = (NSDate *)a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communityIdentifier, 0);
}

@end
