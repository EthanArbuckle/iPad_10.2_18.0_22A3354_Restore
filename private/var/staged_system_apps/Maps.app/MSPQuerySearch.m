@implementation MSPQuerySearch

+ (id)querySearchWithDisplayQuery:(id)a3 locationDisplayString:(id)a4 mapRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)MSPQuerySearch);
  v11 = objc_msgSend(v9, "copy");

  objc_msgSend(v10, "setQuery:", v11);
  v12 = objc_msgSend(v8, "copy");

  objc_msgSend(v10, "setLocationDisplayString:", v12);
  v13 = objc_msgSend(v7, "copy");

  objc_msgSend(v10, "setMapRegion:", v13);
  return v10;
}

@end
