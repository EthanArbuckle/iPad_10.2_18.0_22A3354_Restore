@implementation TSUPair

- (int64_t)sortInteractiveImageChildren:(id)a3
{
  return (int64_t)objc_msgSend(-[TSUPair second](self, "second"), "compare:", objc_msgSend(a3, "second"));
}

@end
