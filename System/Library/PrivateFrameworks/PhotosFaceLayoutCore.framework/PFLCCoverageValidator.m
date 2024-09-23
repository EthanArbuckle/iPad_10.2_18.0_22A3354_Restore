@implementation PFLCCoverageValidator

- (PFLCCoverageValidator)initWithMaskImage:(CGImage *)a3 orientation:(unsigned int)a4
{
  uint64_t v4;
  PFLCCoverageValidator *v6;
  size_t Width;
  size_t Height;
  uint64_t v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  CGColorSpace *v14;
  id v15;
  size_t v16;
  id v17;
  void *v18;
  CGContext *v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  char *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  void *context;
  CGAffineTransform v42;
  CGAffineTransform v43;
  objc_super v44;
  CGAffineTransform transform;
  CGAffineTransform v46;
  CGAffineTransform buf;
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v4 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)PFLCCoverageValidator;
  v6 = -[PFLCCoverageValidator init](&v44, sel_init);
  if (v6)
  {
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    context = (void *)MEMORY[0x249503674]();
    memset(&v43, 0, sizeof(v43));
    makePresentationTransform(v4, Width, Height, (uint64_t)&v43);
    buf = v43;
    v9 = (uint64_t)rint(makePresentationSize((float64x2_t *)&buf, (double)Width, (double)Height) * 0.25);
    v11 = (uint64_t)rint(v10 * 0.25);
    v6->_width = v9;
    v6->_height = v11;
    v42 = v43;
    pflc_layout_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(_QWORD *)((char *)&buf.a + 4) = v9;
      WORD2(buf.b) = 2048;
      *(_QWORD *)((char *)&buf.b + 6) = v11;
      _os_log_impl(&dword_243C35000, v12, OS_LOG_TYPE_DEFAULT, "createScaledInputData: scale input data to == %ldx%ld", (uint8_t *)&buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", (v11 + 1) * (v9 + 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF288]);
    v15 = v13;
    v16 = CGColorSpaceGetNumberOfComponents(v14) & 0x1FFFFFFFFFFFFFFFLL;
    v17 = objc_retainAutorelease(v15);
    v18 = (void *)objc_msgSend(v17, "mutableBytes");

    v19 = CGBitmapContextCreate(v18, v9 + 1, v11 + 1, 8uLL, v16 * (v9 + 1), v14, 0);
    CGColorSpaceRelease(v14);
    memset(&buf, 0, sizeof(buf));
    v46 = v42;
    uprightCTM(a3, &v46, (uint64_t)&buf);
    transform = buf;
    memset(&v46, 0, sizeof(v46));
    CGAffineTransformInvert(&v46, &transform);
    transform = buf;
    CGContextConcatCTM(v19, &transform);
    transform = v46;
    v49.origin.x = 1.0;
    v49.origin.y = 0.0;
    v49.size.width = (double)(unint64_t)v9;
    v49.size.height = (double)(unint64_t)v11;
    v50 = CGRectApplyAffineTransform(v49, &transform);
    CGContextDrawImage(v19, v50, a3);
    CGContextRelease(v19);
    v20 = v6->_width;
    v21 = v6->_height;
    v22 = v17;
    v23 = v20 + 1;
    v24 = (char *)malloc_type_malloc(4 * (v20 + 1) * (v21 + 1), 0x518E5AE4uLL);
    v25 = objc_retainAutorelease(v22);
    v26 = objc_msgSend(v25, "bytes");
    v27 = 4 * v20;
    if (v20 != -1)
      bzero(v24, v27 + 4);
    if (v21 != -1)
    {
      v28 = -1;
      v29 = v24;
      do
      {
        *v29 = 0;
        ++v28;
        v29 = (_DWORD *)((char *)v29 + v27 + 4);
      }
      while (v21 != v28);
      if (v21 + 1 >= 2)
      {
        v30 = &v24[4 * v23];
        v31 = (unsigned __int8 *)(v26 + v20 + 2);
        v32 = 1;
        v33 = v24;
        v34 = v24;
        v35 = &v24[4 * v20 + 8];
        do
        {
          v34 += 4;
          if (v23 >= 2)
          {
            v36 = 0;
            v37 = v20;
            do
            {
              v38 = *v31++;
              *(_DWORD *)&v35[v36] = *(_DWORD *)&v30[v36] + v38 + *(_DWORD *)&v34[v36] - *(_DWORD *)&v33[v36];
              v36 += 4;
              --v37;
            }
            while (v37);
            v34 += v36;
            v33 += v36;
            v30 += v36;
            v35 += v36;
          }
          ++v31;
          v35 += 4;
          v30 += 4;
          v33 += 4;
        }
        while (v32++ != v21);
      }
    }

    v6->_cumulativeData = (unsigned int *)v24;
    objc_autoreleasePoolPop(context);
  }
  return v6;
}

- (void)dealloc
{
  unsigned int *cumulativeData;
  objc_super v4;

  cumulativeData = self->_cumulativeData;
  if (cumulativeData)
    free(cumulativeData);
  v4.receiver = self;
  v4.super_class = (Class)PFLCCoverageValidator;
  -[PFLCCoverageValidator dealloc](&v4, sel_dealloc);
}

- (double)coverageOfTimeLabel:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL IsEmpty;
  double result;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  unsigned int *cumulativeData;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsEmpty = CGRectIsEmpty(a3);
  result = 0.0;
  if (!IsEmpty)
  {
    v10 = self->_width;
    v11 = (double)v10;
    v12 = (double)self->_height;
    CGAffineTransformMakeScale(&v18, (double)v10, v12);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v20 = CGRectApplyAffineTransform(v19, &v18);
    if (v20.origin.x < 0.0)
      v20.origin.x = 0.0;
    if (v20.origin.y < 0.0)
      v20.origin.y = 0.0;
    if (v20.size.width > v11 - v20.origin.x)
      v20.size.width = v11 - v20.origin.x;
    v13 = (uint64_t)rint(v20.origin.x + 1.0);
    if (v20.size.height > v12 - v20.origin.y)
      v20.size.height = v12 - v20.origin.y;
    v14 = (uint64_t)rint(v20.origin.x + v20.size.width + -1.0 + 1.0);
    v15 = (uint64_t)rint(v20.origin.y + 1.0);
    v16 = rint(v20.origin.y + v20.size.height + -1.0 + 1.0);
    cumulativeData = self->_cumulativeData;
    return (double)(cumulativeData[(uint64_t)v16 * (v10 + 1) + v14]
                  - (cumulativeData[(uint64_t)v16 * (v10 + 1) - 1 + v13]
                   + cumulativeData[v14 + (v15 - 1) * (v10 + 1)])
                  + cumulativeData[(v15 - 1) * (v10 + 1) - 1 + v13])
         / (v20.size.width
          * v20.size.height
          * 255.0);
  }
  return result;
}

@end
