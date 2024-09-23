@implementation TRIPBDuration

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)_MergedGlobals_15;
  if (!_MergedGlobals_15)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    if (!qword_1ECF0E6C0)
      qword_1ECF0E6C0 = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_15)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDuration.pbobjc.m"), 96, CFSTR("Startup recursed!"));
    _MergedGlobals_15 = (uint64_t)v2;
  }
  return v2;
}

- (TRIPBDuration)initWithTimeInterval:(double)a3
{
  TRIPBDuration *v4;
  uint64_t v5;
  objc_super v7;
  double __y;

  v7.receiver = self;
  v7.super_class = (Class)TRIPBDuration;
  v4 = -[TRIPBMessage init](&v7, sel_init);
  if (v4)
  {
    __y = 0.0;
    v5 = (int)(modf(a3, &__y) * 1000000000.0);
    -[TRIPBDuration setSeconds:](v4, "setSeconds:", (uint64_t)__y);
    -[TRIPBDuration setNanos:](v4, "setNanos:", v5);
  }
  return v4;
}

- (double)timeInterval
{
  uint64_t v3;

  v3 = -[TRIPBDuration seconds](self, "seconds");
  return (double)(int)-[TRIPBDuration nanos](self, "nanos") / 1000000000.0 + (double)v3;
}

- (void)setTimeInterval:(double)a3
{
  uint64_t v4;
  double __y;

  __y = 0.0;
  v4 = (int)(modf(a3, &__y) * 1000000000.0);
  -[TRIPBDuration setSeconds:](self, "setSeconds:", (uint64_t)__y);
  -[TRIPBDuration setNanos:](self, "setNanos:", v4);
}

@end
