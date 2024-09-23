@implementation Z4jllpwHToTDp9hq

- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 nN3snF4sAp0Cxy6t:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 tNXuX79TcZPxzyjn:(id)a6
{
  void (**v8)(id, kjAS9HuCdR1m5txL *);
  id v9;
  id v10;
  unint64_t v11;
  unint64_t var3;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _TtC3asd25ASBiomeMaterializedViewer *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  kjAS9HuCdR1m5txL *v25;
  id v27;
  id v28;

  v27 = a3;
  v8 = (void (**)(id, kjAS9HuCdR1m5txL *))a6;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a5->var3);
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a5->var3);
  if (a5->var3)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "setObject:atIndexedSubscript:", &stru_1004F2E38, v11, v27);
      objc_msgSend(v10, "setObject:atIndexedSubscript:", &off_1004F4BA0, v11++);
      var3 = a5->var3;
    }
    while (v11 < var3);
    if ((_DWORD)var3)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = (char *)a5->var2 + v13;
        v16 = *((int *)v15 + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *((_QWORD *)v15 + 2), *((unsigned int *)v15 + 2)));
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v17, v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)a5->var2 + v13)));
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v18, v16);

        ++v14;
        v13 += 24;
      }
      while (v14 < a5->var3);
    }
  }
  v19 = objc_opt_new(_TtC3asd25ASBiomeMaterializedViewer);
  v28 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASBiomeMaterializedViewer runWithQuery:inputColNames:inputColTypes:error:](v19, "runWithQuery:inputColNames:inputColTypes:error:", v27, v9, v10, &v28));
  v21 = v28;
  v22 = v21;
  if (v21)
  {
    v23 = objc_msgSend(v21, "code");

    v24 = 0;
  }
  else
  {
    v23 = 0;
    v24 = v20;
  }
  v25 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v24, v23);
  v8[2](v8, v25);

  return (int64_t)v23;
}

@end
