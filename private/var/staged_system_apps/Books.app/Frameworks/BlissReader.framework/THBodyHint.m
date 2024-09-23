@implementation THBodyHint

- (void)dealloc
{
  objc_super v3;

  -[THBodyHint setAnchoredAttachmentPositions:](self, "setAnchoredAttachmentPositions:", 0);
  -[THBodyHint setFirstChildHint:](self, "setFirstChildHint:", 0);
  -[THBodyHint setLastChildHint:](self, "setLastChildHint:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THBodyHint;
  -[THBodyHint dealloc](&v3, "dealloc");
}

- (void)setHints:(const void *)a3
{
  char *p_mHints;

  p_mHints = (char *)&self->mHints;
  if (p_mHints != a3)
    sub_4EBD4(p_mHints, *(char **)a3, *((_QWORD *)a3 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4));
}

- (vector<TSWPTargetHint,)hints
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<TSWPTargetHint, std::allocator<TSWPTargetHint>> *)sub_4ED5C(retstr, self->mHints.__begin_, (uint64_t)self->mHints.__end_, 0xCCCCCCCCCCCCCCCDLL* ((self->mHints.__end_ - self->mHints.__begin_) >> 4));
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint
{
  if (self->mHints.__end_ == self->mHints.__begin_)
    return 0;
  else
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)self->mHints.__begin_;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;

  end = self->mHints.__end_;
  if (end == self->mHints.__begin_)
    return 0;
  else
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)((char *)end - 80);
}

- (unint64_t)startCharIndex
{
  return *((_QWORD *)self->mHints.__begin_ + 4);
}

- (void)offsetStartCharIndexBy:(int64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  int64_t v4;
  unint64_t v5;
  int64x2_t v6;
  int64x2_t *v7;

  begin = self->mHints.__begin_;
  v4 = self->mHints.__end_ - begin;
  if (v4)
  {
    v5 = v4 / 80;
    if (v5 <= 1)
      v5 = 1;
    v6 = vdupq_n_s64(a3);
    v7 = (int64x2_t *)((char *)begin + 48);
    do
    {
      v7[-1].i64[0] += a3;
      *v7 = vaddq_s64(*v7, v6);
      v7 += 5;
      --v5;
    }
    while (v5);
  }
}

- (_NSRange)range
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  NSUInteger location;
  NSUInteger length;
  NSRange v6;
  _NSRange result;

  begin = self->mHints.__begin_;
  end = self->mHints.__end_;
  if (end == begin)
  {
    location = NSInvalidRange[0];
    length = NSInvalidRange[1];
  }
  else
  {
    v6 = NSUnionRange(*((NSRange *)begin + 2), *((NSRange *)end - 3));
    length = v6.length;
    location = v6.location;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)startAnchoredCharIndex
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->mHints.__begin_;
  if (self->mHints.__end_ == begin)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return *((_QWORD *)begin + 7);
}

- (_NSRange)anchoredRange
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  NSUInteger location;
  NSUInteger length;
  NSRange v6;
  _NSRange result;

  begin = self->mHints.__begin_;
  end = self->mHints.__end_;
  if (end == begin)
  {
    location = NSInvalidRange[0];
    length = NSInvalidRange[1];
  }
  else
  {
    v6 = NSUnionRange(*(NSRange *)((char *)begin + 56), *(NSRange *)((char *)end - 24));
    length = v6.length;
    location = v6.location;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  $76C9DF09DF30CB4FBD89D11B5573AD82 *v3;

  v3 = -[THBodyHint lastHint](self, "lastHint");
  if (self->mHints.__end_ == self->mHints.__begin_ || v3 == 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v3->var2;
}

- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v8;
  char *v9;
  unint64_t *v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;

  begin = self->mHints.__begin_;
  if (*((_QWORD *)begin + 4) >= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm"), 120, CFSTR("trimming will remove all characters from this page hint"));
    begin = self->mHints.__begin_;
  }
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - begin) >> 4) - 1;
  v9 = (char *)begin + 80 * v8;
  v11 = *((_QWORD *)v9 + 6);
  v10 = (unint64_t *)(v9 + 48);
  if (v11 < a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm"), 124, CFSTR("Bad charIndex"));
  v12 = (char *)begin + 80 * v8;
  v15 = *((_QWORD *)v12 + 4);
  v14 = (unint64_t *)(v12 + 32);
  v13 = v15;
  if (v15 > a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm"), 125, CFSTR("Bad charIndex"));
    v13 = *v14;
  }
  *((_QWORD *)begin + 10 * v8 + 5) = a3 - v13;
  *v10 = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THBodyHint)initWithCoder:(id)a3
{
  uint64_t v4;
  THBodyHint *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  CGFloat width;
  CGFloat height;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  _UNKNOWN **v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  double v35;
  CGFloat x;
  double v37;
  CGFloat y;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  _UNKNOWN **v57;
  uint64_t v58;
  void *v59;
  id v60;
  unint64_t value;
  char *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v63;
  char *begin;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  CGFloat *v69;
  CGFloat *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  Class v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSSet *v80;
  id v82;
  void **p_begin;
  char *v84;
  void *v85;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)THBodyHint;
  v5 = -[THBodyHint init](&v86, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSDictionary, v4);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSString, v7), 0);
    v10 = objc_opt_class(NSDictionary, v9);
    v5->mAnchoredAttachmentPositions = (NSDictionary *)(id)TSUDynamicCast(v10, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("anchoredPositionAttachments")));
    v11 = &AEAnnotationPopoverShouldHideNotification_ptr;
    v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue, v12), CFSTR("codingSize"));
    v82 = a3;
    if (v13)
    {
      objc_msgSend(v13, "CGSizeValue");
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    v5->mSize.width = width;
    v5->mSize.height = height;
    v17 = objc_opt_class(NSArray, v14);
    v19 = objc_opt_class(NSDictionary, v18);
    v21 = objc_opt_class(NSValue, v20);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v19, v21, objc_opt_class(NSString, v22), 0);
    v25 = objc_opt_class(NSArray, v24);
    v85 = (void *)TSUDynamicCast(v25, objc_msgSend(v82, "decodeObjectOfClasses:forKey:", v23, CFSTR("hints")));
    v84 = (char *)objc_msgSend(v85, "count");
    if ((uint64_t)v84 >= 1)
    {
      v27 = 0;
      p_begin = (void **)&v5->mHints.__begin_;
      v28 = &AEAnnotationPopoverShouldHideNotification_ptr;
      do
      {
        v29 = objc_opt_class(NSDictionary, v26);
        v30 = (void *)TSUDynamicCast(v29, objc_msgSend(v85, "objectAtIndexedSubscript:", v27));
        v32 = objc_opt_class(v11[467], v31);
        v33 = (void *)TSUDynamicCast(v32, objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("frameBounds")));
        if (v33)
        {
          objc_msgSend(v33, "CGRectValue");
          x = v35;
          y = v37;
          v40 = v39;
          v42 = v41;
        }
        else
        {
          x = CGRectZero.origin.x;
          y = CGRectZero.origin.y;
          v40 = CGRectZero.size.width;
          v42 = CGRectZero.size.height;
        }
        v43 = objc_opt_class(v11[467], v34);
        v44 = (void *)TSUDynamicCast(v43, objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("range")));
        if (v44)
        {
          v46 = objc_msgSend(v44, "rangeValue");
          v47 = v45;
        }
        else
        {
          v46 = 0;
          v47 = 0;
        }
        v48 = objc_opt_class(v28[445], v45);
        v49 = (void *)TSUDynamicCast(v48, objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("nextWidowPullsDownFromCharIndex")));
        if (v49)
          v51 = objc_msgSend(v49, "unsignedIntegerValue");
        else
          v51 = 0;
        v52 = objc_opt_class(v11[467], v50);
        v53 = (void *)TSUDynamicCast(v52, objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("anchoredRange")));
        if (v53)
        {
          v55 = objc_msgSend(v53, "rangeValue");
          v56 = v54;
        }
        else
        {
          v55 = 0;
          v56 = 0;
        }
        v57 = v28;
        v58 = objc_opt_class(v28[445], v54);
        v59 = (void *)TSUDynamicCast(v58, objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("columnCount")));
        if (v59)
          v60 = objc_msgSend(v59, "unsignedIntegerValue");
        else
          v60 = 0;
        end = (char *)v5->mHints.__end_;
        value = (unint64_t)v5->mHints.__end_cap_.__value_;
        if ((unint64_t)end >= value)
        {
          begin = (char *)*p_begin;
          v65 = 0xCCCCCCCCCCCCCCCDLL * ((end - (_BYTE *)*p_begin) >> 4);
          v66 = v65 + 1;
          if (v65 + 1 > 0x333333333333333)
            sub_36C30();
          v67 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(value - (_QWORD)begin) >> 4);
          if (2 * v67 > v66)
            v66 = 2 * v67;
          if (v67 >= 0x199999999999999)
            v26 = 0x333333333333333;
          else
            v26 = v66;
          if (v26)
          {
            v68 = (char *)sub_3C97C((uint64_t)&v5->mHints.__end_cap_, v26);
            begin = (char *)v5->mHints.__begin_;
            end = (char *)v5->mHints.__end_;
          }
          else
          {
            v68 = 0;
          }
          v69 = (CGFloat *)&v68[80 * v65];
          *v69 = x;
          v69[1] = y;
          v69[2] = v40;
          v69[3] = v42;
          *((_QWORD *)v69 + 4) = v46;
          *((_QWORD *)v69 + 5) = v47;
          *((_QWORD *)v69 + 6) = v51;
          *((_QWORD *)v69 + 7) = v55;
          *((_QWORD *)v69 + 8) = v56;
          *((_QWORD *)v69 + 9) = v60;
          v70 = v69;
          v28 = v57;
          if (end != begin)
          {
            do
            {
              *((_OWORD *)v70 - 5) = *((_OWORD *)end - 5);
              v71 = *((_OWORD *)end - 4);
              v72 = *((_OWORD *)end - 3);
              v73 = *((_OWORD *)end - 1);
              *((_OWORD *)v70 - 2) = *((_OWORD *)end - 2);
              *((_OWORD *)v70 - 1) = v73;
              *((_OWORD *)v70 - 4) = v71;
              *((_OWORD *)v70 - 3) = v72;
              v70 -= 10;
              end -= 80;
            }
            while (end != begin);
            begin = (char *)*p_begin;
          }
          v11 = &AEAnnotationPopoverShouldHideNotification_ptr;
          v63 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v69 + 10);
          v5->mHints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v70;
          v5->mHints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v69 + 10);
          v5->mHints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v68[80 * v26];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *(CGFloat *)end = x;
          *((CGFloat *)end + 1) = y;
          *((CGFloat *)end + 2) = v40;
          *((CGFloat *)end + 3) = v42;
          *((_QWORD *)end + 4) = v46;
          *((_QWORD *)end + 5) = v47;
          *((_QWORD *)end + 6) = v51;
          *((_QWORD *)end + 7) = v55;
          v63 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 80);
          *((_QWORD *)end + 8) = v56;
          *((_QWORD *)end + 9) = v60;
          v28 = v57;
          v11 = &AEAnnotationPopoverShouldHideNotification_ptr;
        }
        v5->mHints.__end_ = v63;
        ++v27;
      }
      while (v27 != v84);
    }
    v74 = NSClassFromString(CFSTR("TSDDefaultHint"));
    v76 = objc_opt_class(THBodyHint, v75);
    v78 = objc_opt_class(THPageHint, v77);
    v80 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v74, v76, v78, objc_opt_class(TSTLayoutHint, v79), 0);
    v5->mFirstChildHint = (TSDHint *)objc_msgSend(v82, "decodeObjectOfClasses:forKey:", v80, CFSTR("firstChildHint"));
    v5->mLastChildHint = (TSDHint *)objc_msgSend(v82, "decodeObjectOfClasses:forKey:", v80, CFSTR("lastChildHint"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(a3, "encodeObject:forKey:", -[THBodyHint anchoredAttachmentPositions](self, "anchoredAttachmentPositions"), CFSTR("anchoredPositionAttachments"));
  -[THBodyHint size](self, "size");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"), CFSTR("codingSize"));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - self->mHints.__begin_) >> 4));
  begin = self->mHints.__begin_;
  if (self->mHints.__end_ != begin)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (_QWORD *)((char *)begin + v7);
      v10[0] = CFSTR("frameBounds");
      v11[0] = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *(double *)((char *)begin + v7), *(double *)((char *)begin + v7 + 8), *(double *)((char *)begin + v7 + 16), *(double *)((char *)begin + v7 + 24));
      v10[1] = CFSTR("range");
      v11[1] = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v9[4], v9[5]);
      v10[2] = CFSTR("nextWidowPullsDownFromCharIndex");
      v11[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9[6]);
      v10[3] = CFSTR("anchoredRange");
      v11[3] = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v9[7], v9[8]);
      v10[4] = CFSTR("columnCount");
      v11[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9[9]);
      objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 5));
      ++v8;
      begin = self->mHints.__begin_;
      v7 += 80;
    }
    while (v8 < 0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - begin) >> 4));
  }
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("hints"));

  objc_msgSend(a3, "encodeObject:forKey:", self->mFirstChildHint, CFSTR("firstChildHint"));
  objc_msgSend(a3, "encodeObject:forKey:", self->mLastChildHint, CFSTR("lastChildHint"));
}

- (NSDictionary)anchoredAttachmentPositions
{
  return self->mAnchoredAttachmentPositions;
}

- (void)setAnchoredAttachmentPositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (TSDHint)firstChildHint
{
  return self->mFirstChildHint;
}

- (void)setFirstChildHint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDHint)lastChildHint
{
  return self->mLastChildHint;
}

- (void)setLastChildHint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->mHints.__begin_;
  if (begin)
  {
    self->mHints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
