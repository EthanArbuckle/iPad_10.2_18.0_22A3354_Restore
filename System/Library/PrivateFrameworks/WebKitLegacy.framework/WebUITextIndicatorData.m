@implementation WebUITextIndicatorData

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebUITextIndicatorData;
  -[WebUITextIndicatorData dealloc](&v3, sel_dealloc);
}

- (UIImage)dataInteractionImage
{
  return self->_dataInteractionImage;
}

- (void)setDataInteractionImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGRect)selectionRectInRootViewCoordinates
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionRectInRootViewCoordinates.origin.x;
  y = self->_selectionRectInRootViewCoordinates.origin.y;
  width = self->_selectionRectInRootViewCoordinates.size.width;
  height = self->_selectionRectInRootViewCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSelectionRectInRootViewCoordinates:(CGRect)a3
{
  self->_selectionRectInRootViewCoordinates = a3;
}

- (CGRect)textBoundingRectInRootViewCoordinates
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textBoundingRectInRootViewCoordinates.origin.x;
  y = self->_textBoundingRectInRootViewCoordinates.origin.y;
  width = self->_textBoundingRectInRootViewCoordinates.size.width;
  height = self->_textBoundingRectInRootViewCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextBoundingRectInRootViewCoordinates:(CGRect)a3
{
  self->_textBoundingRectInRootViewCoordinates = a3;
}

- (NSArray)textRectsInBoundingRectCoordinates
{
  return self->_textRectsInBoundingRectCoordinates;
}

- (void)setTextRectsInBoundingRectCoordinates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIImage)contentImageWithHighlight
{
  return self->_contentImageWithHighlight;
}

- (void)setContentImageWithHighlight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIImage)contentImageWithoutSelection
{
  return self->_contentImageWithoutSelection;
}

- (void)setContentImageWithoutSelection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CGRect)contentImageWithoutSelectionRectInRootViewCoordinates
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.x;
  y = self->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.y;
  width = self->_contentImageWithoutSelectionRectInRootViewCoordinates.size.width;
  height = self->_contentImageWithoutSelectionRectInRootViewCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentImageWithoutSelectionRectInRootViewCoordinates:(CGRect)a3
{
  self->_contentImageWithoutSelectionRectInRootViewCoordinates = a3;
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (void)setContentImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (UIColor)estimatedBackgroundColor
{
  return self->_estimatedBackgroundColor;
}

- (void)setEstimatedBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (double)contentImageScaleFactor
{
  return self->_contentImageScaleFactor;
}

- (void)setContentImageScaleFactor:(double)a3
{
  self->_contentImageScaleFactor = a3;
}

- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 textIndicatorData:(const void *)a4 scale:(double)a5
{
  WebUITextIndicatorData *v8;
  uint64_t (**v9)(void);
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  WebCore::DestinationColorSpace *NSArrayElement;
  const FloatRect *v19;
  WebCore::DestinationColorSpace *v20;
  uint64_t v21;
  WebCore *v22;
  uint64_t v23;
  WebCore::DestinationColorSpace *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  WebCore::NativeImage *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  int v35;
  uint64_t v36;
  WebCore::DestinationColorSpace *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  WebCore::NativeImage *v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  id v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  WebCore::NativeImage *v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  WebCore::NativeImage *v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)WebUITextIndicatorData;
  v8 = -[WebUITextIndicatorData init](&v70, sel_init);
  if (!v8)
    return v8;
  v9 = (uint64_t (**)(void))MEMORY[0x1E0DCDF10];
  v8->_dataInteractionImage = (UIImage *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCDF10])()), "initWithCGImage:scale:orientation:", a3, 5, a5);
  WebCore::FloatRect::operator CGRect();
  v8->_selectionRectInRootViewCoordinates.origin.x = v10;
  v8->_selectionRectInRootViewCoordinates.origin.y = v11;
  v8->_selectionRectInRootViewCoordinates.size.width = v12;
  v8->_selectionRectInRootViewCoordinates.size.height = v13;
  WebCore::FloatRect::operator CGRect();
  v8->_textBoundingRectInRootViewCoordinates.origin.x = v14;
  v8->_textBoundingRectInRootViewCoordinates.origin.y = v15;
  v8->_textBoundingRectInRootViewCoordinates.size.width = v16;
  v8->_textBoundingRectInRootViewCoordinates.size.height = v17;
  NSArrayElement = (WebCore::DestinationColorSpace *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a4 + 15));
  v20 = NSArrayElement;
  v21 = *((unsigned int *)a4 + 15);
  if ((_DWORD)v21)
  {
    v22 = (WebCore *)*((_QWORD *)a4 + 6);
    v23 = 16 * v21;
    do
    {
      NSArrayElement = (WebCore::DestinationColorSpace *)WebCore::makeNSArrayElement(v22, v19);
      if (NSArrayElement)
        NSArrayElement = (WebCore::DestinationColorSpace *)-[WebCore::DestinationColorSpace addObject:](v20, "addObject:", NSArrayElement);
      v22 = (WebCore *)((char *)v22 + 16);
      v23 -= 16;
    }
    while (v23);
  }
  v8->_textRectsInBoundingRectCoordinates = (NSArray *)v20;
  v8->_contentImageScaleFactor = *((float *)a4 + 16);
  if (*((_QWORD *)a4 + 9))
  {
    v24 = (WebCore::DestinationColorSpace *)objc_alloc((Class)(*v9)());
    v25 = *((_QWORD *)a4 + 9);
    v26 = WebCore::DestinationColorSpace::SRGB(v24);
    (*(void (**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v25 + 288))(&v69, v25, v26);
    NSArrayElement = -[WebCore::DestinationColorSpace initWithCGImage:scale:orientation:](v24, "initWithCGImage:scale:orientation:", *(_QWORD *)WebCore::NativeImage::platformImage(v69), 5, a5);
    v8->_contentImageWithHighlight = (UIImage *)NSArrayElement;
    v28 = v69;
    v69 = 0;
    if (v28)
    {
      v29 = *((_QWORD *)v28 + 1);
      if (__ldaxr((unsigned __int8 *)v29))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)v29))
      {
        goto LABEL_13;
      }
      NSArrayElement = (WebCore::DestinationColorSpace *)MEMORY[0x1D82A3914](v29);
LABEL_13:
      v31 = *(_QWORD *)(v29 + 8);
      v32 = v31 - 1;
      *(_QWORD *)(v29 + 8) = v31 - 1;
      if (v31 == 1)
      {
        v36 = *(_QWORD *)(v29 + 16);
        v33 = *(_QWORD *)(v29 + 24);
        *(_QWORD *)(v29 + 24) = 0;
        v34 = v36 != 0;
        LODWORD(v36) = __ldxr((unsigned __int8 *)v29);
        if ((_DWORD)v36 == 1)
        {
LABEL_15:
          if (!__stlxr(0, (unsigned __int8 *)v29))
          {
            if (v32)
              goto LABEL_25;
            goto LABEL_21;
          }
LABEL_20:
          NSArrayElement = (WebCore::DestinationColorSpace *)WTF::Lock::unlockSlow((WTF::Lock *)v29);
          if (v32)
            goto LABEL_25;
LABEL_21:
          if (v33)
            NSArrayElement = (WebCore::DestinationColorSpace *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
          if (!v34)
            NSArrayElement = (WebCore::DestinationColorSpace *)WTF::fastFree((WTF *)v29, v27);
          goto LABEL_25;
        }
      }
      else
      {
        v33 = 0;
        v34 = 1;
        v35 = __ldxr((unsigned __int8 *)v29);
        if (v35 == 1)
          goto LABEL_15;
      }
      __clrex();
      goto LABEL_20;
    }
  }
LABEL_25:
  if (!*((_QWORD *)a4 + 11))
    goto LABEL_43;
  v37 = (WebCore::DestinationColorSpace *)objc_alloc((Class)(*v9)());
  v38 = *((_QWORD *)a4 + 11);
  v39 = WebCore::DestinationColorSpace::SRGB(v37);
  (*(void (**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v38 + 288))(&v69, v38, v39);
  NSArrayElement = -[WebCore::DestinationColorSpace initWithCGImage:scale:orientation:](v37, "initWithCGImage:scale:orientation:", *(_QWORD *)WebCore::NativeImage::platformImage(v69), 0, a5);
  v8->_contentImage = (UIImage *)NSArrayElement;
  v41 = v69;
  v69 = 0;
  if (!v41)
    goto LABEL_43;
  v42 = *((_QWORD *)v41 + 1);
  if (__ldaxr((unsigned __int8 *)v42))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v42))
  {
    goto LABEL_31;
  }
  NSArrayElement = (WebCore::DestinationColorSpace *)MEMORY[0x1D82A3914](v42);
LABEL_31:
  v44 = *(_QWORD *)(v42 + 8);
  v45 = v44 - 1;
  *(_QWORD *)(v42 + 8) = v44 - 1;
  if (v44 != 1)
  {
    v46 = 0;
    v47 = 1;
    v48 = __ldxr((unsigned __int8 *)v42);
    if (v48 == 1)
      goto LABEL_33;
LABEL_37:
    __clrex();
    goto LABEL_38;
  }
  v49 = *(_QWORD *)(v42 + 16);
  v46 = *(_QWORD *)(v42 + 24);
  *(_QWORD *)(v42 + 24) = 0;
  v47 = v49 != 0;
  LODWORD(v49) = __ldxr((unsigned __int8 *)v42);
  if ((_DWORD)v49 != 1)
    goto LABEL_37;
LABEL_33:
  if (!__stlxr(0, (unsigned __int8 *)v42))
  {
    if (v45)
      goto LABEL_43;
    goto LABEL_39;
  }
LABEL_38:
  NSArrayElement = (WebCore::DestinationColorSpace *)WTF::Lock::unlockSlow((WTF::Lock *)v42);
  if (v45)
    goto LABEL_43;
LABEL_39:
  if (v46)
    NSArrayElement = (WebCore::DestinationColorSpace *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v46 + 8))(v46);
  if (!v47)
    NSArrayElement = (WebCore::DestinationColorSpace *)WTF::fastFree((WTF *)v42, v40);
LABEL_43:
  v50 = *((_QWORD *)a4 + 10);
  if (!v50)
    goto LABEL_62;
  v51 = WebCore::DestinationColorSpace::SRGB(NSArrayElement);
  v52 = (*(_QWORD *(**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v50 + 288))(&v69, v50, v51);
  if (!v69)
    goto LABEL_62;
  v53 = objc_alloc((Class)((uint64_t (*)(_QWORD *))*v9)(v52));
  v8->_contentImageWithoutSelection = (UIImage *)objc_msgSend(v53, "initWithCGImage:scale:orientation:", *(_QWORD *)WebCore::NativeImage::platformImage(v69), 0, a5);
  WebCore::FloatRect::operator CGRect();
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.x = v55;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.y = v56;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.size.width = v57;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.size.height = v58;
  v59 = v69;
  v69 = 0;
  if (!v59)
    goto LABEL_62;
  v60 = *((_QWORD *)v59 + 1);
  if (__ldaxr((unsigned __int8 *)v60))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v60))
  {
    goto LABEL_50;
  }
  MEMORY[0x1D82A3914](v60);
LABEL_50:
  v62 = *(_QWORD *)(v60 + 8);
  v63 = v62 - 1;
  *(_QWORD *)(v60 + 8) = v62 - 1;
  if (v62 != 1)
  {
    v64 = 0;
    v65 = 1;
    v66 = __ldxr((unsigned __int8 *)v60);
    if (v66 == 1)
      goto LABEL_52;
LABEL_56:
    __clrex();
    goto LABEL_57;
  }
  v67 = *(_QWORD *)(v60 + 16);
  v64 = *(_QWORD *)(v60 + 24);
  *(_QWORD *)(v60 + 24) = 0;
  v65 = v67 != 0;
  LODWORD(v67) = __ldxr((unsigned __int8 *)v60);
  if ((_DWORD)v67 != 1)
    goto LABEL_56;
LABEL_52:
  if (!__stlxr(0, (unsigned __int8 *)v60))
  {
    if (!v63)
      goto LABEL_58;
    goto LABEL_62;
  }
LABEL_57:
  WTF::Lock::unlockSlow((WTF::Lock *)v60);
  if (!v63)
  {
LABEL_58:
    if (v64)
      (*(void (**)(uint64_t))(*(_QWORD *)v64 + 8))(v64);
    if (!v65)
      WTF::fastFree((WTF *)v60, v54);
  }
LABEL_62:
  if ((*((_WORD *)a4 + 53) & 0x800) != 0)
  {
    WebCore::cocoaColor();
    v8->_estimatedBackgroundColor = (UIColor *)v69;
  }
  return v8;
}

- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 scale:(double)a4
{
  WebUITextIndicatorData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebUITextIndicatorData;
  v6 = -[WebUITextIndicatorData init](&v8, sel_init);
  if (v6)
    v6->_dataInteractionImage = (UIImage *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCDF10])()), "initWithCGImage:scale:orientation:", a3, 5, a4);
  return v6;
}

@end
