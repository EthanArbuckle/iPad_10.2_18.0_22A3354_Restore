@implementation GeoRequestResponseLogDetailViewController

- (GeoRequestResponseLogDetailViewController)initWithEvent:(id)a3
{
  id v5;
  GeoRequestResponseLogDetailViewController *v6;
  GeoRequestResponseLogDetailViewController *v7;
  id *p_event;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *mapItems;
  UISearchController *v21;
  UISearchController *searchController;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)GeoRequestResponseLogDetailViewController;
  v6 = -[GeoRequestResponseLogDetailViewController init](&v30, "init");
  v7 = v6;
  if (v6)
  {
    p_event = (id *)&v6->_event;
    objc_storeStrong((id *)&v6->_event, a3);
    v7->_lastHighlightedRange = (_NSRange)xmmword_100E34B10;
    if (objc_msgSend(*p_event, "eventType") == 2
      && objc_msgSend(*p_event, "messageType") == 60)
    {
      v25 = v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_event, "decodedMessage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "mapsResultsCount")));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapsResults"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v16, "hasPlace"))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForPlaceData:](GEOMapItemStorage, "mapItemStorageForPlaceData:", v17));

              if (v18)
                objc_msgSend(v10, "addObject:", v18);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v10, "count"))
      {
        v19 = (NSArray *)objc_msgSend(v10, "copy");
        mapItems = v7->_mapItems;
        v7->_mapItems = v19;

      }
      v5 = v25;
    }
    v21 = (UISearchController *)objc_alloc_init((Class)UISearchController);
    searchController = v7->_searchController;
    v7->_searchController = v21;

    -[UISearchController setDelegate:](v7->_searchController, "setDelegate:", v7);
    -[UISearchController setActive:](v7->_searchController, "setActive:", 1);
    -[UISearchController setSearchResultsUpdater:](v7->_searchController, "setSearchResultsUpdater:", v7);
    -[UISearchController setObscuresBackgroundDuringPresentation:](v7->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  UISearchController *searchController;
  void *v8;
  UITextView *v9;
  UITextView *textView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)GeoRequestResponseLogDetailViewController;
  -[GeoRequestResponseLogDetailViewController viewDidLoad](&v32, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = objc_alloc_init((Class)NSMutableArray);
  if (-[NSArray count](self->_mapItems, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("PlaceCard"), 0, self, "_showPlaceCard");
    objc_msgSend(v4, "addObject:", v5);

  }
  v31 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Share"), 0, self, "_showShareAction");
  objc_msgSend(v4, "addObject:", v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItems:", v4);

  searchController = self->_searchController;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setSearchController:", searchController);

  v9 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v9;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_textView);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_textView, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v33[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_textView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v33[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v25 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_textView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v33[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_textView, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v33[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *text;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSMutableAttributedString *v13;
  NSMutableAttributedString *attributedText;
  objc_super v15;
  NSAttributedStringKey v16;
  void *v17;

  v15.receiver = self;
  v15.super_class = (Class)GeoRequestResponseLogDetailViewController;
  -[GeoRequestResponseLogDetailViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORequestResponsePersistedEvent decodedMessage](self->_event, "decodedMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsonRepresentation"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, 0));
  v7 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
  text = self->_text;
  self->_text = v7;

  v9 = objc_alloc((Class)NSMutableAttributedString);
  v10 = self->_text;
  v16 = NSForegroundColorAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v13 = (NSMutableAttributedString *)objc_msgSend(v9, "initWithString:attributes:", v10, v12);
  attributedText = self->_attributedText;
  self->_attributedText = v13;

  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", self->_attributedText);
}

- (void)_showPlaceCard
{
  void *v3;
  NSArray *mapItems;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GeoRequestResponseLogDetailViewController *v9;

  if ((id)-[NSArray count](self->_mapItems, "count") == (id)1)
  {
    -[GeoRequestResponseLogDetailViewController _showPlaceCardAt:](self, "_showPlaceCardAt:", 0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Select Place"), CFSTR("Multiple Places in the result, please select one"), 0));
    mapItems = self->_mapItems;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10026C250;
    v7[3] = &unk_1011AE3A8;
    v8 = v3;
    v9 = self;
    v6 = v3;
    -[NSArray enumerateObjectsUsingBlock:](mapItems, "enumerateObjectsUsingBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Nevermind"), 1, 0));
    objc_msgSend(v6, "addAction:", v5);

    -[GeoRequestResponseLogDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
}

- (void)_showShareAction
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[15];
  NSString *text;

  v3 = objc_alloc((Class)UIActivityViewController);
  text = self->_text;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &text, 1));
  v5 = objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v4, 0);

  v10[0] = UIActivityTypePostToFacebook;
  v10[1] = UIActivityTypePostToWeibo;
  v10[2] = UIActivityTypePrint;
  v10[3] = UIActivityTypeAssignToContact;
  v10[4] = UIActivityTypeSaveToCameraRoll;
  v10[5] = UIActivityTypeAddToReadingList;
  v10[6] = UIActivityTypePostToFlickr;
  v10[7] = UIActivityTypePostToVimeo;
  v10[8] = UIActivityTypePostToTencentWeibo;
  v10[9] = UIActivityTypeOpenInIBooks;
  v10[10] = UIActivityTypeMarkupAsPDF;
  v10[11] = UIActivityTypeSharePlay;
  v10[12] = UIActivityTypeCollaborationInviteWithLink;
  v10[13] = UIActivityTypeCollaborationCopyLink;
  v10[14] = UIActivityTypeAddToHomeScreen;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 15));
  objc_msgSend(v5, "setExcludedActivityTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORequestResponsePersistedEvent identifier](self->_event, "identifier"));
  objc_msgSend(v5, "setTitle:", v7);

  if ((objc_opt_respondsToSelector(v5, "popoverPresentationController") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

  }
  -[GeoRequestResponseLogDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_showPlaceCardAt:(unint64_t)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = objc_alloc((Class)MUPlaceViewController);
  v6 = objc_alloc((Class)MKMapItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_mapItems, "objectAtIndexedSubscript:", a3));
  v8 = objc_msgSend(v6, "initWithGeoMapItem:isPlaceHolderPlace:", v7, 0);
  v10 = objc_msgSend(v5, "initWithMapItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (void)searchFor:(id)a3
{
  id v4;
  NSUInteger v5;
  id v6;
  NSUInteger v7;
  _NSRange *p_lastHighlightedRange;
  NSMutableAttributedString *attributedText;
  void *v10;

  v4 = -[NSString rangeOfString:options:](self->_text, "rangeOfString:options:", a3, 1);
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    p_lastHighlightedRange = &self->_lastHighlightedRange;
    if (self->_lastHighlightedRange.length)
      -[NSMutableAttributedString removeAttribute:range:](self->_attributedText, "removeAttribute:range:", NSBackgroundColorAttributeName, p_lastHighlightedRange->location);
    p_lastHighlightedRange->location = (NSUInteger)v6;
    self->_lastHighlightedRange.length = v7;
    attributedText = self->_attributedText;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSBackgroundColorAttributeName, v10, p_lastHighlightedRange->location, self->_lastHighlightedRange.length);

    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", self->_attributedText);
    -[UITextView scrollRangeToVisible:](self->_textView, "scrollRangeToVisible:", v6, v7);
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[GeoRequestResponseLogDetailViewController searchFor:](self, "searchFor:", v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[GeoRequestResponseLogDetailViewController searchFor:](self, "searchFor:", a4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  _NSRange *p_lastHighlightedRange;
  NSMutableAttributedString *attributedText;
  void *v6;

  p_lastHighlightedRange = &self->_lastHighlightedRange;
  if (self->_lastHighlightedRange.length)
  {
    -[NSMutableAttributedString removeAttribute:range:](self->_attributedText, "removeAttribute:range:", NSBackgroundColorAttributeName, p_lastHighlightedRange->location);
    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", self->_attributedText);
    *p_lastHighlightedRange = (_NSRange)xmmword_100E34B10;
  }
  attributedText = self->_attributedText;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor", a3));
  -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSBackgroundColorAttributeName, v6, p_lastHighlightedRange->location, p_lastHighlightedRange->length);

  -[UITextView scrollRangeToVisible:](self->_textView, "scrollRangeToVisible:", 0, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
