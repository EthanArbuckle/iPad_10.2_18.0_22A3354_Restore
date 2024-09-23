@implementation NSString(StdString)

- (uint64_t)rtcStdString
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "rtcStdStringForString:", a1);
}

+ (void)rtcStdStringForString:()StdString
{
  id v3;
  char *v4;
  unint64_t v5;
  size_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;

  v11 = a1;
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (char *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = v5;
  if (!v4 && v5)
    goto LABEL_15;
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v5 > 0x16)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    v10 = (char *)operator new(v8 + 1);
    a2[1] = v6;
    a2[2] = v9 | 0x8000000000000000;
    *a2 = v10;
    a2 = v10;
    v7 = &v10[v6];
    if (v10 > v4)
      goto LABEL_11;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v5;
    v7 = (char *)a2 + v5;
    if (a2 > (_QWORD *)v4)
      goto LABEL_11;
  }
  if (v7 > v4)
  {
LABEL_15:
    __break(1u);
    return;
  }
LABEL_11:
  if (v6)
    memmove(a2, v4, v6);
  *v7 = 0;

}

+ (id)rtcStringForStdString:()StdString
{
  id v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = *((char *)a3 + 23);
  if (v5 >= 0)
    v6 = a3;
  else
    v6 = (uint64_t *)*a3;
  if (v5 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = a3[1];
  return (id)objc_msgSend(v4, "initWithBytes:length:encoding:", v6, v7, 4);
}

@end
