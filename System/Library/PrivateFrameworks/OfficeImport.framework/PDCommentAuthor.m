@implementation PDCommentAuthor

- (PDCommentAuthor)init
{
  PDCommentAuthor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDCommentAuthor;
  result = -[PDCommentAuthor init](&v3, sel_init);
  if (result)
  {
    result->mId = -1;
    *(_QWORD *)&result->mLastCommentIndex = -1;
  }
  return result;
}

- (void)setId:(unsigned int)a3
{
  self->mId = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (void)setInitials:(id)a3
{
  objc_storeStrong((id *)&self->mInitials, a3);
}

- (void)setColorIndex:(unsigned int)a3
{
  self->mColorIndex = a3;
}

- (unsigned)id
{
  return self->mId;
}

- (id)name
{
  return self->mName;
}

- (id)initials
{
  return self->mInitials;
}

- (unsigned)lastCommentIndex
{
  return self->mLastCommentIndex;
}

- (void)setLastCommentIndex:(unsigned int)a3
{
  self->mLastCommentIndex = a3;
}

- (unsigned)colorIndex
{
  return self->mColorIndex;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDCommentAuthor;
  -[PDCommentAuthor description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mInitials, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
