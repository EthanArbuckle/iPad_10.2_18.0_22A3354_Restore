@implementation THWPRepLine

+ (id)lineWithLineMetrics:(id *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  CGSize size;

  result = objc_alloc_init(THWPRepLine);
  v5 = *(_OWORD *)&a3->var1;
  v6 = *(_OWORD *)&a3->var3;
  size = a3->var0.size;
  *(CGPoint *)((char *)result + 8) = a3->var0.origin;
  *(_OWORD *)((char *)result + 56) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  *(CGSize *)((char *)result + 24) = size;
  return result;
}

- ($7BE0D44FB4096312BEEDFE684BFD847A)lineMetrics
{
  CGSize v3;
  __int128 v4;

  v3 = *(CGSize *)&self->var0.size.height;
  retstr->var0.origin = *(CGPoint *)&self->var0.origin.y;
  retstr->var0.size = v3;
  v4 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

@end
