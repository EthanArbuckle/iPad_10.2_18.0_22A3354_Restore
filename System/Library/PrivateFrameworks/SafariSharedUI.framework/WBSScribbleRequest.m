@implementation WBSScribbleRequest

- (WBSScribbleRequest)initWithLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  WBSScribbleRequest *v5;
  WBSScribbleRequest *v6;
  uint64_t v7;
  WBSScribbleRequest *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)WBSScribbleRequest;
  v5 = -[WBSScribbleRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_location.x = x;
    v5->_location.y = y;
    v7 = nextRequestID++;
    v5->_requestID = v7;
    v8 = v5;
  }

  return v6;
}

- (WBSScribbleRequest)initWithCoder:(id)a3
{
  id v4;
  WBSScribbleRequest *v5;
  float v6;
  CGFloat v7;
  float v8;
  WBSScribbleRequest *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSScribbleRequest;
  v5 = -[WBSScribbleRequest init](&v11, sel_init);
  if (v5)
  {
    v5->_requestID = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("requestID"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x"));
    v7 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y"));
    v5->_location.x = v7;
    v5->_location.y = v8;
    v9 = v5;
  }

  return v5;
}

- (NSString)functionBody
{
  return (NSString *)CFSTR("return ScribbleControllerJS.elementInfoAtPoint(x, y, requestID)");
}

- (NSDictionary)arguments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("requestID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t requestID_low;
  CGFloat x;
  CGFloat y;
  id v7;

  requestID_low = LODWORD(self->_requestID);
  v7 = a3;
  objc_msgSend(v7, "encodeInt:forKey:", requestID_low, CFSTR("requestID"));
  x = self->_location.x;
  *(float *)&x = x;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("x"), x);
  y = self->_location.y;
  *(float *)&y = y;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("y"), y);

}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

@end
