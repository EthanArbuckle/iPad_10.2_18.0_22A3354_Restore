@implementation BICDescribedImageWithScore

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[BICDescribedImageWithScore score](self, "score");
  v6 = objc_msgSend(v4, "score");

  if (v5 < (unint64_t)v6)
    return -1;
  else
    return v5 != (_QWORD)v6;
}

- (BICDescribedImage)image
{
  return (BICDescribedImage *)objc_loadWeakRetained((id *)&self->_image);
}

- (void)setImage:(id)a3
{
  objc_storeWeak((id *)&self->_image, a3);
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_image);
}

@end
