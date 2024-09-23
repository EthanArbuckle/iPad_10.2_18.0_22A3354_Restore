@implementation PKPayLaterImageRow

- (PKPayLaterImageRow)initWithImage:(id)a3
{
  id v5;
  PKPayLaterImageRow *v6;
  PKPayLaterImageRow *v7;
  __int128 v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterImageRow;
  v6 = -[PKPayLaterImageRow init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    v8 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *(_OWORD *)&v7->_contentEdgeInsets.top = *MEMORY[0x1E0DC3298];
    *(_OWORD *)&v7->_contentEdgeInsets.bottom = v8;
  }

  return v7;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  -[UIImage description](self->_image, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPayLaterImageRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", self->_image);
    objc_msgSend(v4, "setDirectionalLayoutMargins:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.leading, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.trailing);
    objc_msgSend(v6, "setContentConfiguration:", v4);
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundConfiguration:", v5);

    objc_msgSend(v6, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  }

}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_image);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterImageRow *v4;
  PKPayLaterImageRow *v5;
  float64x2_t *v6;
  char v7;

  v4 = (PKPayLaterImageRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
      v7 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentEdgeInsets.top, v6[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentEdgeInsets.bottom, v6[2]))), 0xFuLL)));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (NSDirectionalEdgeInsets)contentEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  leading = self->_contentEdgeInsets.leading;
  bottom = self->_contentEdgeInsets.bottom;
  trailing = self->_contentEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
