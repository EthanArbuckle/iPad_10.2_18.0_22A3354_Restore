@implementation PHTextFeature(PGTextFeature)

+ (id)pg_textFeatureForFeature:()PGTextFeature
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  float v13;
  uint64_t v14;
  double v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v4, "type");
      switch(v6)
      {
        case 0:
        case 1:
        case 2:
        case 7:
        case 11:
        case 12:
        case 14:
        case 16:
        case 23:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 37:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "loggingConnection");
          v8 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", objc_msgSend(v4, "type"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 138412290;
            v18 = v9;
            _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Cannot create a PHTextFeature from PGFeature type %@", (uint8_t *)&v17, 0xCu);

          }
          goto LABEL_7;
        case 3:
          v6 = 1;
          break;
        case 4:
        case 5:
        case 6:
          break;
        case 8:
        case 20:
          v6 = 7;
          break;
        case 9:
          v6 = 10;
          break;
        case 10:
          v6 = 9;
          break;
        case 13:
          v6 = 12;
          break;
        case 15:
          v6 = 2;
          break;
        case 17:
          v6 = 14;
          break;
        case 18:
          v6 = 11;
          break;
        case 19:
          v6 = 3;
          break;
        case 21:
          v6 = 15;
          break;
        case 22:
          v6 = 16;
          break;
        case 24:
          v6 = 17;
          break;
        case 25:
          v6 = 18;
          break;
        case 26:
          v6 = 19;
          break;
        case 36:
          v6 = 13;
          break;
        default:
          v6 = 0;
          break;
      }
      v10 = (void *)MEMORY[0x1E0CD17E0];
      objc_msgSend(v4, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "weight");
      v13 = v12;
      v14 = objc_msgSend(v4, "origin");
      *(float *)&v15 = v13;
      objc_msgSend(v10, "textFeatureWithType:string:weight:origin:", v6, v11, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_7:
    v5 = 0;
  }

  return v5;
}

@end
