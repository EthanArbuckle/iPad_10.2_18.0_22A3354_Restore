@implementation RAPSearchHistoryItemTableViewCell

- (void)setHistoryItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  RAPTwoLinesViewModelImpl *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyItem"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100C7D4E0;
  v31 = sub_100C7D4F0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100C7D4E0;
  v25 = sub_100C7D4F0;
  v26 = 0;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchText"));
  v7 = (void *)v28[5];
  v28[5] = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "historyEntry"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100C7D4F8;
  v17[3] = &unk_1011EA728;
  v19 = &v27;
  v20 = &v21;
  v9 = v4;
  v18 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100C7D614;
  v16[3] = &unk_1011BF230;
  v16[4] = &v27;
  objc_msgSend(v8, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v17, 0, v16, 0);

  if (!v22[5])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[RAP] Cell_subtitle_for_a_previous_search_with_results_and_no_location"), CFSTR("localized string not found"), 0));

    v12 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, objc_msgSend(v9, "searchResultsCount")));
    v13 = (void *)v22[5];
    v22[5] = v12;

  }
  v14 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  -[RAPTwoLinesViewModelImpl setTitle:](v14, "setTitle:", v28[5]);
  -[RAPTwoLinesViewModelImpl setSubtitle:](v14, "setSubtitle:", v22[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search")));
  -[RAPTwoLinesViewModelImpl setImage:](v14, "setImage:", v15);

  -[RAPTwoLinesMenuTableViewCell setViewModel:](self, "setViewModel:", v14);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

@end
