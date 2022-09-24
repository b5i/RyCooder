public extension String {

  public mutating func addedBash(color: Color, style: TextStyle) {
    self = style.render() + color.render()
           + self
           + TextStyle.none.render() + Color.none.render()
  }

  public func addingBash(color: Color, style: TextStyle) -> String {
    var string = self
    string.addedBash(color: color, style: style)
    return string
  }
}

internal protocol StringRendering {

  func render() -> String
}

extension Color: StringRendering {

  func render() -> String {
    return "\(rawValue)m"
  }
}

extension TextStyle: StringRendering {

  func render() -> String {
    return "\u{1B}[\(rawValue);"
  }
}

