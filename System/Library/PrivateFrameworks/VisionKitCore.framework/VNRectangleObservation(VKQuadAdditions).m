@implementation VNRectangleObservation(VKQuadAdditions)

- (uint64_t)summaryDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "topLeft");
  v4 = v3;
  objc_msgSend(a1, "topLeft");
  v6 = v5;
  objc_msgSend(a1, "topRight");
  v8 = v7;
  objc_msgSend(a1, "topRight");
  v10 = v9;
  objc_msgSend(a1, "bottomLeft");
  v12 = v11;
  objc_msgSend(a1, "bottomLeft");
  v14 = v13;
  objc_msgSend(a1, "bottomRight");
  v16 = v15;
  objc_msgSend(a1, "bottomRight");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("TL:%.2f %.2f TR:%.2f %.2f BL:%.2f %.2f BR:%.2f %.2f"), v4, v6, v8, v10, v12, v14, v16, v17);
}

@end
