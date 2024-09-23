@implementation WAMessageAWD

- (id)_valuesForRepeatedField:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  if (objc_msgSend(objc_msgSend(a3, "repeatableValues"), "count"))
  {
    v5 = 0;
    do
      objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(a3, "repeatableValues"), "objectAtIndex:", v5++));
    while (v5 < (unint64_t)objc_msgSend(objc_msgSend(a3, "repeatableValues"), "count"));
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSNumber *v11;
  const char *v12;
  WAMessageAWD *v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *context;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  context = objc_autoreleasePoolPush();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(-[WAMessageAWD mutableFields](self, "mutableFields"), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = "-[WAMessageAWD(WiFi) dictionaryRepresentation]";
    v8 = *(_QWORD *)v23;
    v21 = v4;
LABEL_3:
    v9 = 0;
    while (2)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      switch((unint64_t)objc_msgSend(v10, "type"))
      {
        case 1uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          objc_msgSend(v10, "doubleValue");
          v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          goto LABEL_23;
        case 2uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          objc_msgSend(v10, "floatValue");
          v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          goto LABEL_23;
        case 3uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "int32Value"));
          goto LABEL_23;
        case 4uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "int64Value"));
          goto LABEL_23;
        case 5uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "uint32Value"));
          goto LABEL_23;
        case 6uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "uint64Value"));
          goto LABEL_23;
        case 7uLL:
          if (objc_msgSend(v10, "isRepeatable"))
            goto LABEL_22;
          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
          goto LABEL_23;
        case 8uLL:
          if (objc_msgSend(v10, "isRepeatable"))
LABEL_22:
            v11 = -[WAMessageAWD _valuesForRepeatedField:](self, "_valuesForRepeatedField:", v10);
          else
            v11 = (NSNumber *)objc_msgSend(v10, "stringValue");
          goto LABEL_23;
        case 0xAuLL:
          if (objc_msgSend(v10, "isRepeatable"))
          {
            v12 = v7;
            v13 = self;
            v14 = +[NSMutableArray array](NSMutableArray, "array");
            if (objc_msgSend(objc_msgSend(v10, "repeatableValues"), "count"))
            {
              v15 = 0;
              do
              {
                v16 = objc_msgSend(objc_msgSend(v10, "repeatableValues"), "objectAtIndex:", v15);
                v17 = objc_opt_class(WAMessageAWD);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                  objc_msgSend(v14, "addObject:", objc_msgSend(v16, "dictionaryRepresentation"));
                ++v15;
              }
              while (v15 < (unint64_t)objc_msgSend(objc_msgSend(v10, "repeatableValues"), "count"));
            }
            objc_msgSend(v3, "setValue:forKey:", v14, objc_msgSend(v10, "key"));
            self = v13;
            v7 = v12;
            v4 = v21;
          }
          else
          {
            v11 = (NSNumber *)objc_msgSend(objc_msgSend(v10, "subMessageValue"), "dictionaryRepresentation");
LABEL_23:
            objc_msgSend(v3, "setValue:forKey:", v11, objc_msgSend(v10, "key"));
          }
LABEL_24:
          if ((id)++v9 != v6)
            continue;
          v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v6 = v18;
          if (!v18)
            goto LABEL_37;
          goto LABEL_3;
        default:
          NSLog(CFSTR("%s: unhandled field %@"), v7, v10);
          goto LABEL_24;
      }
    }
  }
LABEL_37:
  objc_autoreleasePoolPop(context);
  return v3;
}

@end
