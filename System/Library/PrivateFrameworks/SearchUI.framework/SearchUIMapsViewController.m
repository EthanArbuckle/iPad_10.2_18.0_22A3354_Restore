@implementation SearchUIMapsViewController

- (SearchUIMapsViewController)initWithMapsData:(id)a3 searchAlongTheRoute:(BOOL)a4 feedbackListener:(id)a5 queryId:(unint64_t)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SearchUIMapsViewController *v17;
  SearchUIMapsViewController *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  SearchUIMapsViewController *v23;
  objc_super v24;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D47400], "setInfoCardContainerStyle:", 1);
  v12 = objc_alloc_init(MEMORY[0x1E0D47408]);
  v13 = v12;
  v14 = 0x8000000;
  if (v8)
    v14 = 0x308100000;
  objc_msgSend(v12, "setOptions:", v14 | *MEMORY[0x1E0CC16C8] | *MEMORY[0x1E0CC16D0]);
  if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/CoreParsec.framework"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEffectiveBundle:", v15);

  }
  v24.receiver = self;
  v24.super_class = (Class)SearchUIMapsViewController;
  v17 = -[MUPlaceViewController initWithConfiguration:](&v24, sel_initWithConfiguration_, v13);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_feedbackListener, v11);
    v18->_queryId = a6;
    -[MUPlaceViewController setPlaceViewFeedbackDelegate:](v18, "setPlaceViewFeedbackDelegate:", v18);
    v19 = (void *)MEMORY[0x1E0CC1828];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke;
    v21[3] = &unk_1EA1F62A0;
    v22 = v10;
    v23 = v18;
    objc_msgSend(v19, "_mapItemFromHandle:completionHandler:", v22, v21);

  }
  return v18;
}

void __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CC1828], "mapItemWithSerializedPlaceData:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke_2;
  v5[3] = &unk_1EA1F6210;
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v5);

}

uint64_t __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMapItem:", *(_QWORD *)(a1 + 40));
}

- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  -[SearchUIMapsViewController feedbackListener](self, "feedbackListener", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C4E8]), "initWithFeedbackType:", v4);
    objc_msgSend(v9, "setQueryId:", -[SearchUIMapsViewController queryId](self, "queryId"));
    -[SearchUIMapsViewController feedbackListener](self, "feedbackListener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didEngageCardSection:", v9);

  }
}

- (SFFeedbackListener)feedbackListener
{
  return (SFFeedbackListener *)objc_loadWeakRetained((id *)&self->_feedbackListener);
}

- (void)setFeedbackListener:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackListener, a3);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackListener);
}

@end
