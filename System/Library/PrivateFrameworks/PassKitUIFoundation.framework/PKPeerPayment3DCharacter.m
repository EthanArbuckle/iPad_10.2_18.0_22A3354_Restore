@implementation PKPeerPayment3DCharacter

+ (id)characterWithCharacter:(id)a3 node:(id)a4
{
  id v5;
  id v6;
  PKPeerPayment3DCharacter *v7;
  PKPeerPayment3DCharacter *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PKPeerPayment3DCharacter);
  v8 = v7;
  if (v7)
  {
    -[PKPeerPayment3DCharacter setNode:](v7, "setNode:", v6);
    -[PKPeerPayment3DCharacter setCharacter:](v8, "setCharacter:", v5);
  }

  return v8;
}

- (NSString)character
{
  return self->_character;
}

- (void)setCharacter:(id)a3
{
  objc_storeStrong((id *)&self->_character, a3);
}

- (SCNNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_character, 0);
}

@end
