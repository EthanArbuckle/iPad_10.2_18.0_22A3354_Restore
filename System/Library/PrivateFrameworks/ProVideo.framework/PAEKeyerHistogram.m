@implementation PAEKeyerHistogram

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerHistogram)init
{
  PAEKeyerHistogram *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEKeyerHistogram;
  v2 = -[PAEKeyerHistogram init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    std::vector<int>::vector((std::vector<int> *)v3, 0x8000uLL);
    *(_QWORD *)(v3 + 24) = 0xFFFFFFFF00008000;
    *(_DWORD *)(v3 + 32) = -1;
    v2->_histogram = (void *)v3;
  }
  return v2;
}

- (void)setHistogram:(void *)a3
{
  void **histogram;
  void *v6;
  uint64_t v7;
  int *v8;
  unint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;

  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v6 = *histogram;
    if (*histogram)
    {
      histogram[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x1B5E29170](histogram, 0x1010C404946846FLL);
  }
  v7 = operator new();
  std::vector<int>::vector((std::vector<int> *)v7, 0x8000uLL);
  *(_QWORD *)(v7 + 24) = 0xFFFFFFFF00008000;
  *(_DWORD *)(v7 + 32) = -1;
  self->_histogram = (void *)v7;
  v8 = *(int **)a3;
  v9 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if ((int)(v9 >> 2) >= 1)
  {
    v10 = *(_DWORD **)v7;
    v11 = (v9 >> 2);
    do
    {
      v12 = *v8++;
      *v10++ = v12;
      --v11;
    }
    while (v11);
  }
}

- (void)getHistogram
{
  return self->_histogram;
}

- (void)setHistogramScale:(float)a3
{
  self->_scale = a3;
}

- (float)getHistogramScale
{
  return self->_scale;
}

- (void)setHistogramArray:(id)a3
{
  void **histogram;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t i;
  unsigned int v11;
  unint64_t v12;
  int v13;

  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v6 = *histogram;
    if (*histogram)
    {
      histogram[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x1B5E29170](histogram, 0x1010C404946846FLL);
  }
  v7 = operator new();
  std::vector<int>::vector((std::vector<int> *)v7, 0x8000uLL);
  *(_QWORD *)(v7 + 24) = 0xFFFFFFFF00008000;
  *(_DWORD *)(v7 + 32) = -1;
  self->_histogram = (void *)v7;
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i < v9; i = v12 + 1)
    {
      v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", i), "intValue");
      v12 = i + 1;
      v13 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v12), "intValue");
      if (!(v11 >> 15))
        *(_DWORD *)(*(_QWORD *)v7 + 4 * v11) = v13;
    }
  }
}

- (PAEKeyerHistogram)initWithCoder:(id)a3
{
  PAEKeyerHistogram *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEKeyerHistogram;
  v4 = -[PAEKeyerHistogram init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    -[PAEKeyerHistogram setHistogramArray:](v4, "setHistogramArray:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("Histogram")));
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HistogramScale"));
    if (v7)
      objc_msgSend(v7, "floatValue");
    else
      LODWORD(v8) = 1.0;
    -[PAEKeyerHistogram setHistogramScale:](v4, "setHistogramScale:", v8);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *histogram;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = *((_QWORD *)self->_histogram + 1) - *(_QWORD *)self->_histogram;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((int)(v5 >> 2) >= 1)
  {
    v7 = 0;
    histogram = self->_histogram;
    v9 = (v5 >> 2);
    do
    {
      v10 = *(unsigned int *)(*histogram + 4 * v7);
      if ((int)v10 >= 1)
      {
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10));
      }
      ++v7;
    }
    while (v9 != v7);
  }
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("Histogram"));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PAEKeyerHistogram getHistogramScale](self, "getHistogramScale");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v11, "numberWithFloat:"), CFSTR("HistogramScale"));
}

- (void)dealloc
{
  void **histogram;
  void *v4;
  objc_super v5;

  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v4 = *histogram;
    if (*histogram)
    {
      histogram[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E29170](histogram, 0x1010C404946846FLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)PAEKeyerHistogram;
  -[PAEKeyerHistogram dealloc](&v5, sel_dealloc);
}

@end
