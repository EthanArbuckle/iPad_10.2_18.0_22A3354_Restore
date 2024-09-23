@implementation BKBookmarkPageCount

- (void)setAnnotationRects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("annotationRects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encodedData"));
  }
  else
  {
    v6 = 0;
  }
  -[BKBookmarkPageCount setAnnotationRectsData:](self, "setAnnotationRectsData:", v6);

}

- (id)annotationRects
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkPageCount annotationRectsData](self, "annotationRectsData"));
  if (v2)
  {
    v11 = 0;
    v3 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v2, &v11);
    v4 = 0;
    if (!v11)
    {
      objc_opt_class(NSArray);
      v6 = v5;
      *(_QWORD *)&v7 = objc_opt_class(NSValue).n128_u64[0];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, 0));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("annotationRects")));

      objc_msgSend(v3, "finishDecoding");
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
