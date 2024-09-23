@implementation VSJSItemGroup

- (void)setSelectedItem:(int64_t)a3
{
  id v4;

  self->_selectedItem = a3;
  -[VSJSItemGroup bridge](self, "bridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJSSelectedItem:", a3);

}

- (int64_t)selectedItem
{
  void *v2;
  int64_t v3;

  -[VSJSItemGroup bridge](self, "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jsSelectedItem");

  return v3;
}

- (VSJSItemGroupBridge)bridge
{
  return self->_bridge;
}

- (void)setBridge:(id)a3
{
  objc_storeStrong((id *)&self->_bridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
}

@end
