@implementation ODDTransitionPoint

- (void)setType:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  if (a3 != 3 && a3 != 5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Bad point type"));
  v5.receiver = self;
  v5.super_class = (Class)ODDTransitionPoint;
  -[ODDPoint setType:](&v5, sel_setType_, v3);
}

@end
