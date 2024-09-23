@implementation UIKeyCommand

- (void)music_handleKeyCommand:(void *)a3
{
  id v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = a1;
  v5 = UIKeyCommand.handler.getter();
  if (v5)
  {
    v7 = (uint64_t)v5;
    v8 = v6;
    v5((uint64_t)v4);
    sub_5C198(v7, v8);
  }

}

@end
