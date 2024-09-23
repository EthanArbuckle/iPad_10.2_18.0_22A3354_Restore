@implementation FedStatsDataTypeFactory

+ (int64_t)dataTypeFromString:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(&unk_24D0E0E10, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -2;

  return v5;
}

+ (id)stringFromDataType:(int64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24D0E0E38, "allKeysForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("InvalidType");
  }

  return v5;
}

+ (id)createFedStatsDataType:(id)a3 dataTypeParams:(id)a4 possibleError:(id *)a5
{
  id v7;
  id v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;

  v7 = a3;
  v8 = a4;
  v9 = +[FedStatsDataTypeFactory dataTypeFromString:](FedStatsDataTypeFactory, "dataTypeFromString:", v7);
  switch(v9)
  {
    case -2:
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not defined"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 200;
        goto LABEL_8;
      }
      goto LABEL_14;
    case -1:
      goto LABEL_6;
    case 0:
      v12 = FedStatsBooleanType;
      goto LABEL_13;
    case 1:
      v12 = FedStatsBoundedULongType;
      goto LABEL_13;
    case 2:
      v12 = FedStatsBucketedType;
      goto LABEL_13;
    case 3:
      v12 = FedStatsCategoricalType;
      goto LABEL_13;
    default:
      if (v9 == 99)
      {
        v12 = FedStatsCombinationType;
LABEL_13:
        -[__objc2_class createFromDict:possibleError:](v12, "createFromDict:possibleError:", v8, a5);
        a5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_6:
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not supported"), v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 900;
LABEL_8:
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v11, v10);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          a5 = 0;
        }
      }
LABEL_14:

      return a5;
  }
}

@end
