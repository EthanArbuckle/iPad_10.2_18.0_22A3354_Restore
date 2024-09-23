@implementation MPRecentsContactHeaderViewController

- (MPRecentsContactHeaderViewController)init
{
  MPRecentsContactHeaderViewController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *rttConversationsQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPRecentsContactHeaderViewController;
  v2 = -[MPRecentsContactHeaderViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.mobilephone.rttConversations", v4);
    rttConversationsQueue = v2->_rttConversationsQueue;
    v2->_rttConversationsQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPRecentsContactHeaderViewController;
  -[MPRecentsContactHeaderViewController loadView](&v5, "loadView");
  -[MPRecentsContactHeaderViewController loadRTTConversations](self, "loadRTTConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController generateDetailsView](self, "generateDetailsView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  -[MPRecentsContactHeaderViewController setDetailsView:](self, "setDetailsView:", v4);
  -[MPRecentsContactHeaderViewController loadLayoutConstraints](self, "loadLayoutConstraints");

}

- (void)loadLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController detailsView](self, "detailsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

}

- (id)generateDetailsView
{
  PHRecentCallDetailsView *v3;
  void *v4;

  v3 = -[PHRecentCallDetailsView initWithFrame:]([PHRecentCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PHRecentCallDetailsView setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController recentCall](self, "recentCall"));
  -[PHRecentCallDetailsView setRecentCall:](v3, "setRecentCall:", v4);

  return v3;
}

- (void)loadRTTConversations
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  OS_dispatch_queue *rttConversationsQueue;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11[2];
  id buf[2];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting loadRTTConversations", (uint8_t *)buf, 2u);
  }

  v5 = sub_1000190CC();
  if (v5)
  {
    v6 = v5;
    objc_initWeak(buf, self);
    rttConversationsQueue = self->_rttConversationsQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100029E38;
    v10[3] = &unk_100089DE0;
    objc_copyWeak(v11, buf);
    v11[1] = v6;
    dispatch_async((dispatch_queue_t)rttConversationsQueue, v10);
    objc_destroyWeak(v11);
    objc_destroyWeak(buf);
  }
  else
  {
    v8 = sub_10000E6C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because we could not find RTTUIUtilities", (uint8_t *)buf, 2u);
    }

  }
}

- (int64_t)recentCallTTYType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController recentCall](self, "recentCall"));
  v3 = objc_msgSend(v2, "ttyType");

  return (int64_t)v3;
}

- (id)rttConversationForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController rttConversations](self, "rttConversations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)presentConversationForUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v4 = a3;
  v5 = sub_100019008();
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController rttConversationForUUID:](self, "rttConversationForUUID:", v4));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForConversation:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsContactHeaderViewController navigationController](self, "navigationController"));
      objc_msgSend(v9, "pushViewController:animated:", v8, 1);

    }
    else
    {
      v10 = sub_10000E6C4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10005523C(v11);

    }
  }

}

- (PHRecentCallDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsView, a3);
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
  objc_storeStrong((id *)&self->_recentCall, a3);
}

- (PHRecentsItem)recentsItem
{
  return self->_recentsItem;
}

- (void)setRecentsItem:(id)a3
{
  objc_storeStrong((id *)&self->_recentsItem, a3);
}

- (NSDictionary)rttConversations
{
  return self->_rttConversations;
}

- (void)setRttConversations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rttConversations, 0);
  objc_storeStrong((id *)&self->_recentsItem, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_rttConversationsQueue, 0);
}

@end
