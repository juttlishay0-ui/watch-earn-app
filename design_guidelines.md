# Design Guidelines: Watch & Earn Application

## Design Approach
**Reference-Based Approach** drawing from successful earning/investment applications in the South Asian market (similar to TaskBucks, EarnKaro, MPL) combined with modern fintech aesthetics (Paytm, PhonePe). The design prioritizes trust, clarity, and numerical prominence.

## Core Design Principles
- **Trust-First**: Clean, professional aesthetic that builds credibility for financial transactions
- **Number Prominence**: Earnings, packages amounts, and returns must be immediately visible and bold
- **Information Clarity**: Dense information presented in digestible, scannable cards
- **Mobile-Optimized**: Design assumes primary usage on mobile devices

## Typography System
**Font Families:**
- Primary: Inter (via Google Fonts) - for UI, numbers, and body text
- Accent: Space Grotesk (via Google Fonts) - for package amounts and key earnings numbers

**Hierarchy:**
- Package amounts/Earnings: 2xl to 4xl, font-weight 700-800
- Daily returns/Stats: xl to 2xl, font-weight 600-700
- Labels/Descriptions: sm to base, font-weight 400-500
- Micro text (dates, status): xs to sm, font-weight 400

## Layout System
**Spacing Units:** Tailwind units of 3, 4, 6, 8, and 12 (e.g., p-4, mb-6, gap-8)

**Container Strategy:**
- Max-width: max-w-7xl for main content
- Packages grid: grid-cols-1 md:grid-cols-2 lg:grid-cols-3
- Mobile padding: px-4
- Desktop padding: px-6 to px-8

## Component Library

### Package Cards
- Elevated white cards with subtle border
- Clear visual hierarchy: Amount (largest) → Daily Return → Total Return
- Prominent "Invest Now" button at bottom
- Small badge showing "19% Referral Commission"
- All 6 values clearly displayed: Amount, Daily Videos, Daily Return, Duration, Total Return, Commission

### Dashboard Stats Cards
- Grid layout for key metrics (2 cols mobile, 3-4 cols desktop)
- Each stat card: Large number on top, label below
- Progress indicators for days completed (progress bar or fraction)
- Separate card for "Videos Completed Today" with visual indicator

### Video Watching Interface
- Large embedded YouTube player (16:9 aspect ratio)
- Countdown timer prominently displayed (2xl, bold)
- "Complete" button disabled until 10 seconds, then enabled with clear visual change
- Counter showing "Video X of Y" 
- Lock overlay when daily limit reached

### Withdrawal History Cards
- White background cards with clean left-right split
- Left: Amount in large bold text (xl to 2xl), phone number below in small gray text
- Right: "Credited" status in prominent position, date below in small text
- Subtle divider between entries
- No icons, pure text-based design

### Payment QR Page
- Large, centered QR code (minimum 300x300px)
- Clear upload zone for screenshot with drag-drop visual
- Submit button prominent at bottom
- Instructions text above QR in readable size

### Admin Panel
- Table-based layouts for user management and approvals
- Action buttons (Approve/Reject) with clear color coding
- Dashboard with stat cards showing totals
- Clean data tables with sorting and filtering

## Navigation Structure
- Bottom navigation bar (mobile) with 4-5 key sections
- Top header with app title and balance/profile
- Drawer/hamburger menu for secondary options

## Icons
**Library:** Heroicons (via CDN)
- Use outline style for navigation
- Use solid style for stats and confirmations
- Keep icon usage minimal - focus on text and numbers

## Form Elements
- Input fields with clear labels above
- Phone number input with Pakistan flag/code indicator
- Upload buttons with clear "Choose File" or "Upload Screenshot" text
- Consistent padding: p-3 to p-4
- Border style: rounded-lg with subtle border

## Status Indicators
- Pending: Yellow/amber background with dark text
- Approved: Green background with white text
- Rejected/Locked: Red background with white text
- Use badges/pills for status display

## Responsive Behavior
- Mobile-first: Single column layouts, stacked cards
- Tablet (md): 2-column package grid, expanded dashboard stats
- Desktop (lg): 3-column package grid, side-by-side admin panels

## Images
**No hero images needed.** This is a utility application focused on functionality. Use only:
- QR code image (provided by user)
- User uploaded payment screenshots
- Optional: Small trust badges or payment method logos (JazzCash, Easypaisa icons)

## Critical UX Patterns
- **Restricted Access Flow**: Clear messaging when user hasn't purchased package or is pending approval
- **Daily Reset Indicator**: Visible countdown or indicator showing when videos reset (midnight)
- **Balance Visibility**: User balance always visible in header/dashboard
- **Progress Tracking**: Visual indicators for days completed out of 12

## Accessibility
- High contrast for all earnings numbers
- Clear focus states on all interactive elements
- Readable text sizes (minimum 14px/base)
- Button states clearly differentiated