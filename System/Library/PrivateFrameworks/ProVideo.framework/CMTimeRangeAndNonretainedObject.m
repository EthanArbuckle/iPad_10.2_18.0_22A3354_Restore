@implementation CMTimeRangeAndNonretainedObject

- (CMTimeRangeAndNonretainedObject)initWithCMTimeRange:(id *)a3 andObject:(id)a4
{
  PCWeakPointerValue *v6;
  __int128 v7;
  objc_super v9;
  _OWORD v10[3];

  v6 = +[PCWeakPointerValue valueWithNonretainedObject:](PCWeakPointerValue, "valueWithNonretainedObject:", a4);
  v7 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  v9.receiver = self;
  v9.super_class = (Class)CMTimeRangeAndNonretainedObject;
  return -[FigTimeRangeAndObject initWithCMTimeRange:andObject:](&v9, sel_initWithCMTimeRange_andObject_, v10, v6);
}

- (id)object
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMTimeRangeAndNonretainedObject;
  return (id)objc_msgSend(-[FigTimeRangeAndObject object](&v3, sel_object), "nonretainedObjectValue");
}

@end
