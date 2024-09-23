@implementation ConversationNavigationBarItemsManager

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)initWithScene:(id)a3 delegate:(id)a4 actionHandler:(id)a5 arrowDelegate:(id)a6
{
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  return (_TtC10MobileMail37ConversationNavigationBarItemsManager *)ConversationNavigationBarItemsManager.init(scene:delegate:actionHandler:arrowDelegate:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

- (ComposeCapable)scene
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)ConversationNavigationBarItemsManager.scene.getter();

  return (ComposeCapable *)v5;
}

- (void)setScene:(id)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  ConversationNavigationBarItemsManager.scene.setter((uint64_t)a3);

}

- (_TtP10MobileMail45ConversationNavigationBarItemsManagerDelegate_)delegate
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)ConversationNavigationBarItemsManager.delegate.getter();

  return (_TtP10MobileMail45ConversationNavigationBarItemsManagerDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  ConversationNavigationBarItemsManager.delegate.setter((uint64_t)a3);

}

- (_TtP10MobileMail44ConversationNavigationBarItemsActionHandling_)actionHandler
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)ConversationNavigationBarItemsManager.actionHandler.getter();

  return (_TtP10MobileMail44ConversationNavigationBarItemsActionHandling_ *)v5;
}

- (void)setActionHandler:(id)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  ConversationNavigationBarItemsManager.actionHandler.setter((uint64_t)a3);

}

- (MFArrowControlsViewDelegate)arrowDelegate
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)ConversationNavigationBarItemsManager.arrowDelegate.getter();

  return (MFArrowControlsViewDelegate *)v5;
}

- (void)setArrowDelegate:(id)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  ConversationNavigationBarItemsManager.arrowDelegate.setter((uint64_t)a3);

}

- (BOOL)useArchiveButton
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  char v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.useArchiveButton.getter();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (void)setUseArchiveButton:(BOOL)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  ConversationNavigationBarItemsManager.useArchiveButton.setter(v4 & 1);

}

- (BOOL)showNavigationArrows
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  char v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.showNavigationArrows.getter();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (void)setShowNavigationArrows:(BOOL)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  ConversationNavigationBarItemsManager.showNavigationArrows.setter(v4 & 1);

}

- (BOOL)showSupplementaryButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  char v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.showSupplementaryButtonItem.getter();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (void)setShowSupplementaryButtonItem:(BOOL)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  ConversationNavigationBarItemsManager.showSupplementaryButtonItem.setter(v4 & 1);

}

- (BOOL)useDesktopClassNavigationBar
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  char v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.useDesktopClassNavigationBar.getter();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (void)setUseDesktopClassNavigationBar:(BOOL)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  ConversationNavigationBarItemsManager.useDesktopClassNavigationBar.setter(v4 & 1);

}

- (UIBarButtonItem)doneButton
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.doneButton.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setDoneButton:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.doneButton.setter(a3);

}

- (UIBarButtonItem)doneButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.doneButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (UIBarButtonItem)revealActionsButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.revealActionsButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setRevealActionsButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.revealActionsButtonItem.setter(a3);

}

- (UIBarButtonItem)replyButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.replyButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReplyButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.replyButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)replyButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_100215A08();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)replyAllButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.replyAllButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReplyAllButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.replyAllButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)replyAllButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_100216118();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)forwardButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.forwardButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setForwardButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.forwardButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)forwardButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_1002167C4();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)archiveButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.archiveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setArchiveButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.archiveButtonItem.setter(a3);

}

- (UIBarButtonItem)deleteButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.deleteButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setDeleteButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.deleteButtonItem.setter(a3);

}

- (UIBarButtonItem)destructiveButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.destructiveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (UIBarButtonItemGroup)destructiveButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_100217A90();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)moveButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.moveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setMoveButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.moveButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)moveButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_10021813C();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)flagButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.flagButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setFlagButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.flagButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)flagButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_10021873C();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)readButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.readButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReadButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.readButtonItem.setter(a3);

}

- (UIBarButtonItem)unreadButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.unreadButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setUnreadButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.unreadButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)readButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_1002192D0();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)junkButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.junkButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setJunkButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.junkButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)junkButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_100219A6C();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)muteButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.muteButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setMuteButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.muteButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)muteButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_10021A130();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)laterButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.laterButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setLaterButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.laterButtonItem.setter(a3);

}

- (UIBarButtonItemGroup)laterButtonItemGroup
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_10021A7F4();

  return (UIBarButtonItemGroup *)v5;
}

- (ComposeButtonItem)composeButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.composeButtonItem.getter();

  return (ComposeButtonItem *)v5;
}

- (void)setComposeButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.composeButtonItem.setter(a3);

}

- (UIBarButtonItem)contactLeftDoneButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.contactLeftDoneButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setContactLeftDoneButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.contactLeftDoneButtonItem.setter(a3);

}

- (UIBarButtonItem)leftSpaceItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.leftSpaceItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setLeftSpaceItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.leftSpaceItem.setter(a3);

}

- (UIBarButtonItem)arrowControlsButtonItem
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.arrowControlsButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setArrowControlsButtonItem:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.arrowControlsButtonItem.setter(a3);

}

- (MFArrowControlsView)arrowControlsView
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v2;
  id v5;

  v2 = self;
  v5 = ConversationNavigationBarItemsManager.arrowControlsView.getter();

  return (MFArrowControlsView *)v5;
}

- (void)setArrowControlsView:(id)a3
{
  id v4;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationNavigationBarItemsManager.arrowControlsView.setter(a3);

}

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)init
{
  return (_TtC10MobileMail37ConversationNavigationBarItemsManager *)ConversationNavigationBarItemsManager.init()();
}

- (void).cxx_destruct
{
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_scene);
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_delegate);
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_actionHandler);
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_arrowDelegate);
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_doneButton));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___revealActionsButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___replyButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___replyAllButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___forwardButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___archiveButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___deleteButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___moveButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___flagButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___readButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___unreadButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___junkButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___muteButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___laterButtonItem));
  sub_100221924((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___composeButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___contactLeftDoneButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___leftSpaceItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___arrowControlsButtonItem));
  sub_1001F20D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___arrowControlsView));
  sub_1001ED890((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___buttonMapping));
}

- (void)updateEnabledStatesForMessage:(id)a3
{
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  ConversationNavigationBarItemsManager.updateEnabledStatesForMessage(_:)(a3);

  swift_unknownObjectRelease(a3);
}

- (void)configureNavigationBar:(id)a3 navigationItem:(id)a4
{
  id v5;
  id v6;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v7;

  v5 = a3;
  v6 = a4;
  v7 = self;
  ConversationNavigationBarItemsManager.configureNavigationBar(_:navigationItem:)((UINavigationBar)a3, (UINavigationItem)a4);

}

- (void)configureDesktopClassButtonsFor:(id)a3 isPrimary:(BOOL)a4 isShowingTitle:(BOOL)a5 animated:(BOOL)a6
{
  id v7;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v8;
  char v9;
  char v13;
  char v14;

  v7 = a3;
  v8 = self;
  v13 = _convertObjCBoolToBool(_:)(a4);
  v14 = _convertObjCBoolToBool(_:)(a5);
  v9 = _convertObjCBoolToBool(_:)(a6);
  ConversationNavigationBarItemsManager.configureDesktopClassButtons(for:isPrimary:isShowingTitle:animated:)((UINavigationItem)a3, v13 & 1, v14 & 1, v9 & 1);

}

@end
