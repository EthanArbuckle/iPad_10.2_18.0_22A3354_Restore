@implementation TUICandidateLine

+ (id)reuseIdentifier
{
  return CFSTR("TUICandidateLine");
}

- (void)setStyle:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    objc_msgSend(v6, "lineColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLine setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
