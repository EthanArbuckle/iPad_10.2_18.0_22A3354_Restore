@implementation OpenCVWrapperImage

- (OpenCVWrapperImage)initWithImage:(Mat *)a3
{
  OpenCVWrapperImage *v4;
  OpenCVWrapperImage *v5;
  Mat *p_image;
  BOOL v7;
  UMatData *u;
  unsigned int *v9;
  unsigned int v10;
  UMatData *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  int *p;
  uint64_t dims;
  int v18;
  unint64_t *v19;
  unint64_t *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)OpenCVWrapperImage;
  v4 = -[OpenCVWrapperImage init](&v22, "init");
  v5 = v4;
  p_image = &v4->_image;
  if (v4)
    v7 = p_image == a3;
  else
    v7 = 1;
  if (!v7)
  {
    u = a3->u;
    if (u)
    {
      v9 = (unsigned int *)((char *)u + 20);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
    v11 = v4->_image.u;
    if (v11)
    {
      v12 = (unsigned int *)((char *)v11 + 20);
      do
      {
        v13 = __ldaxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
        sub_100256C90((uint64_t)&v4->_image);
    }
    v5->_image.u = 0;
    *(_OWORD *)&v5->_image.data = 0u;
    *(_OWORD *)&v5->_image.dataend = 0u;
    if (v5->_image.dims <= 0)
    {
      p_image->flags = a3->flags;
    }
    else
    {
      v15 = 0;
      p = v5->_image.size.p;
      do
      {
        p[v15++] = 0;
        dims = v5->_image.dims;
      }
      while (v15 < dims);
      p_image->flags = a3->flags;
      if ((int)dims > 2)
        goto LABEL_21;
    }
    v18 = a3->dims;
    if (v18 <= 2)
    {
      v5->_image.dims = v18;
      *(_QWORD *)&v5->_image.rows = *(_QWORD *)&a3->rows;
      v19 = a3->step.p;
      v20 = v5->_image.step.p;
      *v20 = *v19;
      v20[1] = v19[1];
LABEL_22:
      *(_OWORD *)&v5->_image.data = *(_OWORD *)&a3->data;
      *(_OWORD *)&v5->_image.dataend = *(_OWORD *)&a3->dataend;
      *(_OWORD *)&v5->_image.allocator = *(_OWORD *)&a3->allocator;
      return v5;
    }
LABEL_21:
    sub_100256B48((uint64_t)p_image, (uint64_t)a3);
    goto LABEL_22;
  }
  return v5;
}

- (OpenCVWrapperImage)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(int64_t)a5 pixelData:(void *)a6 bytesPerRow:(unint64_t)a7 scaleFactor:(float)a8
{
  unsigned int v14;
  int v15;
  OpenCVWrapperImage *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  _BYTE *v25;
  uint64_t v26;
  int v27;
  _BYTE *v28;
  uint64_t v29;
  _BYTE v30[4];
  int v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;

  v14 = sub_10000876C(a5);
  sub_10000A364((uint64_t)v30, a4, a3, v14, (uint64_t)a6, a7);
  if (a8 != 1.0)
  {
    v29 = 0;
    v27 = 16842752;
    v28 = v30;
    v24 = 33619968;
    v25 = v30;
    v26 = 0;
    v23 = 0;
    if (a8 >= 1.0)
      v15 = 1;
    else
      v15 = 3;
    sub_100322D5C((uint64_t)&v27, (uint64_t)&v24, (int *)&v23, v15, a8, a8);
  }
  v16 = -[OpenCVWrapperImage initWithImage:](self, "initWithImage:", v30);
  if (v34)
  {
    v17 = (unsigned int *)(v34 + 20);
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      sub_100256C90((uint64_t)v30);
  }
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  if (v31 >= 1)
  {
    v20 = 0;
    v21 = v35;
    do
      *(_DWORD *)(v21 + 4 * v20++) = 0;
    while (v20 < v31);
  }
  if (v36 != &v37)
    j__free(v36);

  return v16;
}

- (OpenCVWrapperImage)initWithUIImage:(id)a3
{
  id v4;
  OpenCVWrapperImage *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  char *v10;
  _OWORD v12[4];
  char *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a3;
  LODWORD(v12[0]) = 1124007936;
  memset((char *)v12 + 4, 0, 48);
  v12[3] = 0u;
  v13 = (char *)v12 + 8;
  v14 = v15;
  v15[0] = 0;
  v15[1] = 0;
  sub_1002AB7E8(v4, (uint64_t)v12, 0);
  v5 = -[OpenCVWrapperImage initWithImage:](self, "initWithImage:", v12);
  if (*((_QWORD *)&v12[3] + 1))
  {
    v6 = (unsigned int *)(*((_QWORD *)&v12[3] + 1) + 20);
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
      sub_100256C90((uint64_t)v12);
  }
  *((_QWORD *)&v12[3] + 1) = 0;
  memset(&v12[1], 0, 32);
  if (SDWORD1(v12[0]) >= 1)
  {
    v9 = 0;
    v10 = v13;
    do
      *(_DWORD *)&v10[4 * v9++] = 0;
    while (v9 < SDWORD1(v12[0]));
  }
  if (v14 != v15)
    j__free(v14);

  return v5;
}

- (OpenCVWrapperImage)initWithSizeOf:(id)a3 pixelFormat:(int64_t)a4
{
  id v6;
  unsigned int v7;
  OpenCVWrapperImage *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v15[8];
  _QWORD *v16;
  void *v17;
  _QWORD v18[2];
  int32x2_t v19;
  _QWORD v20[44];

  v6 = a3;
  v19 = vrev64_s32(**((int32x2_t **)objc_msgSend(v6, "image") + 8));
  v7 = sub_10000876C(a4);
  sub_100254168((uint64_t *)&v19, v7, (uint64_t)v20);
  LODWORD(v15[0]) = 1124007936;
  memset((char *)v15 + 4, 0, 32);
  memset((char *)&v15[4] + 4, 0, 28);
  v16 = &v15[1];
  v17 = v18;
  v18[0] = 0;
  v18[1] = 0;
  (*(void (**)(_QWORD, _QWORD *, _QWORD *, uint64_t))(*(_QWORD *)v20[0] + 24))(v20[0], v20, v15, 0xFFFFFFFFLL);
  v8 = -[OpenCVWrapperImage initWithImage:](self, "initWithImage:", v15);
  if (v15[7])
  {
    v9 = (unsigned int *)(v15[7] + 20);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      sub_100256C90((uint64_t)v15);
  }
  v15[7] = 0;
  memset(&v15[2], 0, 32);
  if (SHIDWORD(v15[0]) >= 1)
  {
    v12 = 0;
    v13 = v16;
    do
      *((_DWORD *)v13 + v12++) = 0;
    while (v12 < SHIDWORD(v15[0]));
  }
  if (v17 != v18)
    j__free(v17);
  sub_100008C98((uint64_t)v20);

  return v8;
}

- (const)getPixelData
{
  return self->_image.data;
}

- (id)clone
{
  OpenCVWrapperImage *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  _OWORD v9[4];
  char *v10;
  void *v11;
  _QWORD v12[2];
  int v13;
  _OWORD *v14;
  uint64_t v15;

  LODWORD(v9[0]) = 1124007936;
  memset((char *)v9 + 4, 0, 48);
  v9[3] = 0u;
  v10 = (char *)v9 + 8;
  v11 = v12;
  v12[0] = 0;
  v12[1] = 0;
  v13 = 33619968;
  v14 = v9;
  v15 = 0;
  sub_1002181EC((uint64_t)&self->_image, (uint64_t)&v13);
  v2 = -[OpenCVWrapperImage initWithImage:]([OpenCVWrapperImage alloc], "initWithImage:", v9);
  if (*((_QWORD *)&v9[3] + 1))
  {
    v3 = (unsigned int *)(*((_QWORD *)&v9[3] + 1) + 20);
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
      sub_100256C90((uint64_t)v9);
  }
  *((_QWORD *)&v9[3] + 1) = 0;
  memset(&v9[1], 0, 32);
  if (SDWORD1(v9[0]) >= 1)
  {
    v6 = 0;
    v7 = v10;
    do
      *(_DWORD *)&v7[4 * v6++] = 0;
    while (v6 < SDWORD1(v9[0]));
  }
  if (v11 != v12)
    j__free(v11);
  return v2;
}

- (void)imWrite:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  void *v7;
  int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14[2];
  void *__p;
  void *v16;
  uint64_t v17;
  int v18;
  OpenCVWrapperImage *v19;
  uint64_t v20;
  _OWORD v21[4];
  char *v22;
  void *v23;
  _QWORD v24[2];

  v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
  LODWORD(v21[0]) = 1124007936;
  memset((char *)v21 + 4, 0, 48);
  v21[3] = 0u;
  v22 = (char *)v21 + 8;
  v23 = v24;
  v24[0] = 0;
  v24[1] = 0;
  self = (OpenCVWrapperImage *)((char *)self + 16);
  v19 = self;
  v20 = 0;
  v18 = 16842752;
  LODWORD(__p) = 50397184;
  v16 = self;
  v17 = 0;
  v8 = sub_100263CBC();
  sub_100204AA0((uint64_t)&v18, (int *)&__p, 32, 5, (uint64_t)v8, 0.0, 255.0);
  v18 = 33619968;
  v19 = self;
  v20 = 0;
  sub_1002044A8((unsigned int *)self, (uint64_t)&v18, 0, 1.0, 0.0);
  v14[0] = 0;
  v14[1] = 0;
  qmemcpy((void *)sub_10029430C(v14, 44), "/var/mobile/Library/Measure/image_scaled.png", 44);
  v19 = self;
  v20 = 0;
  v18 = 16842752;
  __p = 0;
  v16 = 0;
  v17 = 0;
  sub_1002AB9B4((uint64_t)v14, (uint64_t)&v18, &__p);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  sub_10029434C(v14);
  if (*((_QWORD *)&v21[3] + 1))
  {
    v9 = (unsigned int *)(*((_QWORD *)&v21[3] + 1) + 20);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      sub_100256C90((uint64_t)v21);
  }
  *((_QWORD *)&v21[3] + 1) = 0;
  memset(&v21[1], 0, 32);
  if (SDWORD1(v21[0]) >= 1)
  {
    v12 = 0;
    v13 = v22;
    do
      *(_DWORD *)&v13[4 * v12++] = 0;
    while (v12 < SDWORD1(v21[0]));
  }
  if (v23 != v24)
    j__free(v23);

}

- (void)convertTo8U
{
  Mat *p_image;
  int *v3;
  int v4;
  Mat *v5;
  uint64_t v6;
  int v7;
  Mat *v8;
  uint64_t v9;

  p_image = &self->_image;
  v8 = &self->_image;
  v9 = 0;
  v7 = 16842752;
  v4 = 50397184;
  v5 = &self->_image;
  v6 = 0;
  v3 = sub_100263CBC();
  sub_100204AA0((uint64_t)&v7, &v4, 32, 5, (uint64_t)v3, 0.0, 255.0);
  v7 = 33619968;
  v8 = p_image;
  v9 = 0;
  sub_1002044A8((unsigned int *)p_image, (uint64_t)&v7, 0, 1.0, 0.0);
}

- (CGSize)getSize
{
  double cols;
  double rows;
  CGSize result;

  cols = (double)self->_image.cols;
  rows = (double)self->_image.rows;
  result.height = rows;
  result.width = cols;
  return result;
}

- (OpenCVWrapperResourceLock)resourceLock
{
  return self->_resourceLock;
}

- (void)setResourceLock:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLock, a3);
}

- (Mat)image
{
  return &self->_image;
}

- (void).cxx_destruct
{
  UMatData *u;
  Mat *p_image;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int *p;
  OpenCVWrapperImage *v10;

  u = self->_image.u;
  if (u)
  {
    p_image = &self->_image;
    v5 = (unsigned int *)((char *)u + 20);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      sub_100256C90((uint64_t)p_image);
  }
  self->_image.u = 0;
  *(_OWORD *)&self->_image.data = 0u;
  *(_OWORD *)&self->_image.dataend = 0u;
  if (self->_image.dims >= 1)
  {
    v8 = 0;
    p = self->_image.size.p;
    do
      p[v8++] = 0;
    while (v8 < self->_image.dims);
  }
  v10 = (OpenCVWrapperImage *)self->_image.step.p;
  if (v10 != (OpenCVWrapperImage *)self->_image.step.buf)
    j__free(v10);
  objc_storeStrong((id *)&self->_resourceLock, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 1124007936;
  *(_OWORD *)((char *)self + 20) = 0u;
  *(_OWORD *)((char *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 52) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = (char *)self + 24;
  *((_QWORD *)self + 11) = (char *)self + 96;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
