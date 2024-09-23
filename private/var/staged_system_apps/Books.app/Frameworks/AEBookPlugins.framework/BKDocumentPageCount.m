@implementation BKDocumentPageCount

+ (id)newEmptyDocumentPageCount:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKDocumentPageCount).n128_u64[0];
  v6 = objc_msgSend(v3, "newByClass:", v5, v4);

  return v6;
}

@end
