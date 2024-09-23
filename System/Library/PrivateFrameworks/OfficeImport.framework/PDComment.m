@implementation PDComment

- (PDComment)init
{
  PDComment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDComment;
  result = -[PDComment init](&v3, sel_init);
  if (result)
  {
    result->mAuthorId = -1;
    result->mIndex = -1;
  }
  return result;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (id)text
{
  return self->mText;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->mText, a3);
}

- (unint64_t)authorId
{
  return self->mAuthorId;
}

- (void)setAuthorId:(unint64_t)a3
{
  self->mAuthorId = a3;
}

- (id)date
{
  return self->mDate;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->mDate, a3);
}

- (unsigned)index
{
  return self->mIndex;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndex = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDComment;
  -[PDComment description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PDComment)parent
{
  return (PDComment *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->parent, 0);
  objc_storeStrong((id *)&self->mDate, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
