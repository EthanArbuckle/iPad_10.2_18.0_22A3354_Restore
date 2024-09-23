@implementation EKEvent

- (id)pp_eventNameForCategory:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(a1, "customObjectForKey:", *MEMORY[0x1E0D70F30]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "count"))
      {
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0;
        switch(a2)
        {
          case 2:
          case 6:
          case 7:
          case 10:
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 3:
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v12;
            v13 = CFSTR("arrivalStation");
            goto LABEL_13;
          case 4:
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v12;
            v13 = CFSTR("arrivalBusStop");
            goto LABEL_13;
          case 5:
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v12;
            v13 = CFSTR("arrivalBoatTerminal");
LABEL_13:
            objc_msgSend(v12, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
            break;
          default:
            break;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
