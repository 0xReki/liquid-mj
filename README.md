# liquid-mj

*A Liquid tag that makes it easy to output sequences of mahjong using Unicode.* 
Based on [MahjongTile](http://arcturus.su/wiki/Help:MahjongTile).




## Installation

1. Add `gem "liquid-mjt", git: "https://github.com/0xReki/liquid-mj.git"` to your site's Gemfile and run `bundle`
2. Add the following to your site's `_config.yml`:

```yml
gems:
  - liquid-mj
```

## Usage

```liquid
{% mj 1112345678999p,1p' %}
```

<span style="font-size: 300%">🀙🀙🀙🀚🀛🀜🀝🀞🀟🀠🀡🀡🀡&nbsp;&nbsp;<span style="display:inline-block;transform: rotate(-90deg);transform-origin:54% 54%;margin-left:.15em;margin-right:.08em;">🀙</span></span>

## Limits

- No paifu symbols
- Red Fives aren't red
