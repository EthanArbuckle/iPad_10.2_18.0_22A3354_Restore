@implementation CuratedCollectionRichTextParser

- (CuratedCollectionRichTextParser)initWithCollection:(id)a3 collectionItems:(id)a4 traitCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  CuratedCollectionRichTextParser *v12;
  CuratedCollectionRichTextParser *v13;
  NSArray *v14;
  NSArray *collectionItems;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CuratedCollectionRichTextParser;
  v12 = -[CuratedCollectionRichTextParser init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    collectionItems = v13->_collectionItems;
    v13->_collectionItems = v14;

    objc_storeStrong((id *)&v13->_traitCollection, a5);
    -[CuratedCollectionRichTextParser _generatePlainTextDescriptions](v13, "_generatePlainTextDescriptions");
  }

  return v13;
}

- (void)_generatePlainTextDescriptions
{
  CuratedCollectionRichTextParser *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSAttributedString *v7;
  NSObject *p_super;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _UNKNOWN **v13;
  id v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  CuratedCollectionRichTextParser *v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *collectionItemDescriptions;
  void *v32;
  NSArray *obj;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[2];

  v2 = self;
  v45[0] = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser _baseFont](self, "_baseFont"));
  v46[0] = v3;
  v45[1] = NSForegroundColorAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v46[1] = v4;
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));

  v6 = objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionDescription](v2->_collection, "collectionDescription"));
  v32 = (void *)v6;
  if (v6)
  {
    v7 = (NSAttributedString *)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v6, v5);
    p_super = &v2->_collectionDescription->super;
    v2->_collectionDescription = v7;
  }
  else
  {
    v9 = sub_1004316CC();
    p_super = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionTitle](v2->_collection, "collectionTitle"));
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Missing collectionDescription for: %@", buf, 0xCu);

    }
  }
  v11 = (void *)v5;

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSArray count](v2->_collectionItems, "count")));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v2->_collectionItems;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  v13 = MKPlaceCollectionsLogicController_ptr;
  if (v12)
  {
    v14 = v12;
    v35 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v17 = objc_alloc((Class)MKMapItemIdentifier);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placeCollectionItem"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemIdentifier"));
        v20 = objc_msgSend(v17, "initWithGEOMapItemIdentifier:", v19);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placeCollectionItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "itemDescription"));

        if (v22)
        {
          v23 = objc_msgSend(objc_alloc((Class)v13[305]), "initWithString:attributes:", v22, v11);
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v23, v20);
        }
        else
        {
          v24 = sub_1004316CC();
          v23 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placeCollectionItem"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "itemIdentifier"));
            v27 = v11;
            v28 = v2;
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionTitle](v2->_collection, "collectionTitle"));
            *(_DWORD *)buf = 138412546;
            v41 = v26;
            v42 = 2112;
            v43 = v29;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Missing itemDescription for: %@ in Collection: %@", buf, 0x16u);

            v2 = v28;
            v11 = v27;
            v13 = MKPlaceCollectionsLogicController_ptr;

          }
        }

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v14);
  }

  v30 = (NSDictionary *)objc_msgSend(v34, "copy");
  collectionItemDescriptions = v2->_collectionItemDescriptions;
  v2->_collectionItemDescriptions = v30;

}

- (void)_generateRichTextDescriptionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSArray *obj;
  NSObject *group;
  _QWORD block[4];
  id v30;
  id v31;
  uint8_t *v32;
  id v33[2];
  id location;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];

  v24 = a3;
  v4 = sub_1004316CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = sub_1004316CC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ParseRichText", ", buf, 2u);
  }
  v25 = (void *)v6;

  group = dispatch_group_create();
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionHTMLDescription](self->_collection, "collectionHTMLDescription"));
  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x3032000000;
  v46 = sub_100866D88;
  v47 = sub_100866D98;
  v48 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100866DA0;
  v42[3] = &unk_1011D97D0;
  v42[4] = buf;
  -[CuratedCollectionRichTextParser _parseHTMLSnippet:group:completion:](self, "_parseHTMLSnippet:group:completion:", v26, group, v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSArray count](self->_collectionItems, "count")));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_collectionItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v13);
        v15 = objc_alloc((Class)MKMapItemIdentifier);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "placeCollectionItem"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemIdentifier"));
        v18 = objc_msgSend(v15, "initWithGEOMapItemIdentifier:", v17);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "placeCollectionItem"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemHTMLDescription"));

        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100866DB0;
        v35[3] = &unk_1011D97F8;
        v36 = v10;
        v21 = v18;
        v37 = v21;
        -[CuratedCollectionRichTextParser _parseHTMLSnippet:group:completion:](self, "_parseHTMLSnippet:group:completion:", v20, group, v35);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v11);
  }

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100866DC0;
  block[3] = &unk_1011D9820;
  v33[1] = v25;
  objc_copyWeak(v33, &location);
  v32 = buf;
  v30 = v10;
  v31 = v24;
  v22 = v24;
  v23 = v10;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (BOOL)_mergeRichTextCollectionDescription:(id)a3 itemDescriptions:(id)a4
{
  void *collectionDescription;
  NSAttributedString *v8;
  NSAttributedString *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  NSAttributedString *v13;
  NSAttributedString *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *collectionItemDescriptions;
  unsigned __int8 v18;
  char v19;
  NSDictionary *v20;
  NSDictionary *v21;
  _QWORD v23[4];
  id v24;

  collectionDescription = a3;
  if (!a3)
    collectionDescription = self->_collectionDescription;
  v8 = collectionDescription;
  v9 = self->_collectionDescription;
  v10 = a4;
  v11 = a3;
  if (v9 == v8)
    v12 = 1;
  else
    v12 = -[NSAttributedString isEqual:](v9, "isEqual:", v8);
  v13 = self->_collectionDescription;
  self->_collectionDescription = v8;
  v14 = v8;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_collectionItemDescriptions));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100866FCC;
  v23[3] = &unk_1011D9848;
  v24 = v15;
  v16 = v15;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);

  collectionItemDescriptions = self->_collectionItemDescriptions;
  if (collectionItemDescriptions == v16)
    v18 = 1;
  else
    v18 = -[NSDictionary isEqual:](collectionItemDescriptions, "isEqual:", v16);
  v19 = v12 & v18 ^ 1;
  v20 = (NSDictionary *)-[NSDictionary copy](v16, "copy");
  v21 = self->_collectionItemDescriptions;
  self->_collectionItemDescriptions = v20;

  return v19;
}

- (void)parseRichTextDescriptionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (!self->_didParseRichText)
  {
    self->_didParseRichText = 1;
    v6 = v4;
    -[CuratedCollectionRichTextParser _generateRichTextDescriptionsWithCompletion:](self, "_generateRichTextDescriptionsWithCompletion:");
    goto LABEL_5;
  }
  if (v4)
  {
    v6 = v4;
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_5:
    v5 = v6;
  }

}

- (id)_baseFont
{
  return +[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, self->_traitCollection);
}

- (id)_documentCSS
{
  NSString *css;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  css = self->_css;
  if (!css)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser _baseFont](self, "_baseFont"));
    objc_msgSend(v4, "pointSize");
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("html { font-family: -apple-system; -webkit-text-size-adjust: 100%%; font-size: %@px; }"),
                         v8));
    v10 = self->_css;
    self->_css = v9;

    css = self->_css;
  }
  return css;
}

- (id)_documentHTMLWithInnerBodyHTML:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser _documentCSS](self, "_documentCSS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<head><style type=\"text/css\">%@</style></head><body>%@</body>"), v5, v4));

  return v6;
}

- (void)_parseHTMLSnippet:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    dispatch_group_enter(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser _documentHTMLWithInnerBodyHTML:](self, "_documentHTMLWithInnerBodyHTML:", v8));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100867290;
    v12[3] = &unk_1011D9870;
    v13 = v9;
    v14 = v10;
    +[NSAttributedString loadFromHTMLWithString:options:completionHandler:](NSAttributedString, "loadFromHTMLWithString:options:completionHandler:", v11, &__NSDictionary0__struct, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (NSArray)collectionItems
{
  return self->_collectionItems;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSAttributedString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSDictionary)collectionItemDescriptions
{
  return self->_collectionItemDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionItemDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_collectionItems, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_css, 0);
}

@end
