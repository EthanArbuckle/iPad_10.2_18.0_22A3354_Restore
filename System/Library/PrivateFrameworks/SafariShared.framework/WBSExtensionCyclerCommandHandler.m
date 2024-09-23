@implementation WBSExtensionCyclerCommandHandler

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  id v4;
  WBSCyclerItemListRepresentation *v5;

  v4 = a3;
  v5 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:]([WBSCyclerItemListRepresentation alloc], "initWithTitle:uniqueIdentifier:", 0, &stru_1E4B40D18);
  (*((void (**)(id, WBSCyclerItemListRepresentation *))a3 + 2))(v4, v5);

}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

@end
