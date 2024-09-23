@implementation TRIPBTimestamp

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)_MergedGlobals_11;
  if (!_MergedGlobals_11)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    if (!qword_1ECF0E680)
      qword_1ECF0E680 = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_11)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRITimestamp.pbobjc.m"), 96, CFSTR("Startup recursed!"));
    _MergedGlobals_11 = (uint64_t)v2;
  }
  return v2;
}

- (TRIPBTimestamp)initWithDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  return -[TRIPBTimestamp initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:");
}

- (TRIPBTimestamp)initWithTimeIntervalSince1970:(double)a3
{
  TRIPBTimestamp *v4;
  double v5;
  double v6;
  uint64_t v7;
  objc_super v9;
  double __y;

  v9.receiver = self;
  v9.super_class = (Class)TRIPBTimestamp;
  v4 = -[TRIPBMessage init](&v9, sel_init);
  if (v4)
  {
    __y = 0.0;
    v5 = modf(a3, &__y);
    v6 = __y;
    if (v5 < 0.0)
    {
      v6 = __y + -1.0;
      v5 = v5 + 1.0;
    }
    v7 = (int)(v5 * 1000000000.0);
    -[TRIPBTimestamp setSeconds:](v4, "setSeconds:", (uint64_t)v6);
    -[TRIPBTimestamp setNanos:](v4, "setNanos:", v7);
  }
  return v4;
}

- (NSDate)date
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[TRIPBTimestamp timeIntervalSince1970](self, "timeIntervalSince1970");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
}

- (void)setDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  -[TRIPBTimestamp setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:");
}

- (double)timeIntervalSince1970
{
  uint64_t v3;

  v3 = -[TRIPBTimestamp seconds](self, "seconds");
  return (double)(int)-[TRIPBTimestamp nanos](self, "nanos") / 1000000000.0 + (double)v3;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  double v4;
  double v5;
  uint64_t v6;
  double __y;

  __y = 0.0;
  v4 = modf(a3, &__y);
  v5 = __y;
  if (v4 < 0.0)
  {
    v5 = __y + -1.0;
    v4 = v4 + 1.0;
  }
  v6 = (int)(v4 * 1000000000.0);
  -[TRIPBTimestamp setSeconds:](self, "setSeconds:", (uint64_t)v5);
  -[TRIPBTimestamp setNanos:](self, "setNanos:", v6);
}

@end
