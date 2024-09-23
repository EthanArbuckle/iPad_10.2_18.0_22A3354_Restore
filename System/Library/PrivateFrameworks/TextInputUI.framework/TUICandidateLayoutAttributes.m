@implementation TUICandidateLayoutAttributes

- (TUICandidateLayoutAttributes)init
{
  TUICandidateLayoutAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v3, sel_init);
  if (result)
    result->_contentAlpha = 1.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUICandidateLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 44) = self->_candidateNumber;
  *((_QWORD *)result + 45) = *(_QWORD *)&self->_contentAlpha;
  *((_QWORD *)result + 46) = self->_row;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUICandidateLayoutAttributes;
  if (-[UICollectionViewLayoutAttributes isEqual:](&v12, sel_isEqual_, v4)
    && (v5 = -[TUICandidateLayoutAttributes candidateNumber](self, "candidateNumber"),
        v5 == objc_msgSend(v4, "candidateNumber"))
    && (-[TUICandidateLayoutAttributes contentAlpha](self, "contentAlpha"),
        v7 = v6,
        objc_msgSend(v4, "contentAlpha"),
        v7 == v8))
  {
    v11 = -[TUICandidateLayoutAttributes row](self, "row");
    v9 = v11 == objc_msgSend(v4, "row");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)candidateNumber
{
  return self->_candidateNumber;
}

- (void)setCandidateNumber:(unint64_t)a3
{
  self->_candidateNumber = a3;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

@end
