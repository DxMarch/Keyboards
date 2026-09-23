# Karabiner Setup

## Colemak mod D - Command and Option QWERTY
Main typing layout. This configuration expects the standard **US keyboard layout** in macOS and Karabiner-Elements.

- Remaps the keyboard to the custom Colemak-style layout.
- Shift works normally with the remapped letters.
- Command and Option shortcuts remain QWERTY, so shortcuts such as `Cmd+C`, `Cmd+V`, and `Cmd+Z` stay in their normal physical positions.
- Other modifiers can still be used normally.
- For staggered keyboards such as the Corne, `corne_overrides.json` undoes the lower-row `Z → X`, `X → C`, and `C → D` mappings by passing `Z`, `X`, and `C` through unchanged.

## Caps Layer
Caps Lock acts purely as a momentary layer key.

- Holding Caps sets `caps_layer = 1`.
- Releasing Caps sets `caps_layer = 0`.
- Tapping Caps does not toggle Caps Lock.
- Other modifiers such as Shift, Ctrl, Option, and Command can be combined with the layer.

The mappings below refer to the **physical US-layout keys**. For example, press the physical `;` key for the `ø` mapping, regardless of the text layout selected elsewhere in macOS.

### Symbol mappings

The layout below follows the physical rows of a standard US keyboard. The first row in each table shows the physical keys; the second row shows the Caps-layer output.


| `Q` | `W` | `E` | `R` | `T` | `Y` | `U` | `I` |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `!` | `@` | `#` | `$` | `%` | `^` | `&` | `*` |

| `A` | `S` | `D` | `F` | `G` | `H` | `J` | `K` | `L` | `;` | `'` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `` ` `` |  | `{` | `}` | `=` | `\` | `(` | `)` | `-` | `ø` | `å` |

| `Z` | `X` | `C` | `V` | `B` | `N` | `M` | `,` | `.` | `/` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | `[` | `]` |  | `` ` `` |  |  | `=` | `æ` |

Holding Shift produces these alternate outputs:

| `A` | `G` | `H` | `L` | `;` | `'` | `N` | `.` | `/` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `~` | `+` | &#124; | `_` | `Ø` | `Å` | `~` | `+` | `Æ` |

## Caps Programming Layer / Symbol Mapping
The symbol mappings are implemented as Karabiner manipulators conditioned on `caps_layer == 1`.

- Uses the Caps Layer variable rather than treating Caps as a normal modifier.
- Uses `optional: ["any"]` so physical modifiers pass through naturally.
- This avoids duplicate mappings for shifted characters.
- macOS Option combinations are used for Norwegian letters:
  - `Option+O` produces `ø`.
  - `Option+'` produces `æ`.
  - `Option+A` produces `å`.
- Holding Shift at the same time naturally produces Ø, Æ, and Å.